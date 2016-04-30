#include <ida.hpp>
#include <idp.hpp>
#include <dbg.hpp>
#include <loader.hpp>
#include <kernwin.hpp>
#include <bytes.hpp>
#include <offset.hpp>
#include <auto.hpp>
#include <entry.hpp>
#include <name.hpp>
#include <time.h>

#define MAX_NUM_COLORS 15

//How long is a reasonable comment? 100 should be enough.
//What about people who group blocks and "name" them pseudocode?
#define MAX_COMMENT_LEN 100

// delay trail drawing by this many microseconds
// we are performant enough to handle 0 by IDA
// has a race condition that's seems to be
// mitigated by this
#define TRAIL_DELAY 200000

//#define DEBUG

struct queue_hdr {
  struct queue_item *head;
  struct queue_item *foot;
};

struct queue_item {
  unsigned char *s;
  size_t len;
  struct queue_item *next;
};

struct queue_hdr *gq = NULL;

void report_msg(char *s) {
  msg("%s in QIRA plugin. Please report to the maintainers.\n");
}

void init_queue() {
  struct queue_hdr *q = (struct queue_hdr *)qalloc(sizeof(queue_hdr));
  if (q == NULL) {
    report_msg("init_queue: qalloc failed");
    return;
  }
  q->head = NULL;
  q->foot = NULL;
  gq = q;
}

void destroy_queue() {
  if (gq == NULL) {
    report_msg("destroy_queue: no queue to destroy");
    return;
  }
  struct queue_item *cur = gq->head;
  while (cur != NULL) {
    struct queue_item *next = cur->next;
    qfree(cur->s);
    qfree(cur);
    cur = next;
  }
  qfree(gq);
}

// returns 0 on success, -1 on failure
int enqueue(unsigned char *s, size_t len) {
  struct queue_item *qe = (struct queue_item*)qalloc(sizeof(queue_item));
  if (qe == NULL) {
    report_msg("enqueue: qalloc failed");
    return -1;
  }
  
  qe->s = s;
  qe->len = len;
  qe->next = NULL;
  
  if (gq == NULL) {
    report_msg("enqueue: gq == NULL");
    return -1;
  }

  if (gq->foot == NULL) {
    if (gq->head == NULL) {
      report_msg("enqueue: gq->head == NULL");
      return -1;
    }
    gq->head = qe;
    gq->foot = qe;
    return 0;
  }
  
  if (gq->head == NULL || gq->foot == NULL) {
    report_msg("enqueue: null gq->head or gq->foot");
    qfree(qe);
    return -1;
  }
  
  gq->foot->next = qe;
  gq->foot = qe;
  return 0;
}

struct queue_item *dequeue() {
  struct queue_item *head = gq->head;
  if (head == NULL) {
    if (gq->foot != NULL) {
      report_msg("dequeue: non-null gq->foot in dequeue");
    }
    return NULL;
  }
  gq->head = head->next;
  if (gq->head == NULL) {
    //dequeued last element
    gq->foot = NULL;
  }
  return head; //caller must free, since this is a struct
}

// ***************** WEBSOCKETS *******************
#include "libwebsockets.h"

static int callback_http(struct libwebsocket_context* context,
    struct libwebsocket* wsi,
    enum libwebsocket_callback_reasons reason, void* user,
    void* in, size_t len) {
  return 0;
}

ea_t qira_address = BADADDR;
ea_t trail_addresses[MAX_NUM_COLORS] = { 0 };
int trail_i = 0;

static void thread_safe_set_item_color(ea_t a, bgcolor_t b) {
  struct uireq_set_item_color_t: public ui_request_t {
    uireq_set_item_color_t(ea_t a, bgcolor_t b) {
      la = a;
      lb = b;
    }
    virtual bool idaapi run() {
      set_item_color(la, lb);
      return false;
    }
    ea_t la;
    bgcolor_t lb;
  };
  execute_ui_requests(new uireq_set_item_color_t(a, b), NULL);
}

static void thread_safe_set_name(ea_t a, const char *b, int c) {
  struct uireq_set_name_t: public ui_request_t {
    uireq_set_name_t(ea_t a, const char *b, int c) {
      la = a;
      lb = b;
      lc = c;
    }
    virtual bool idaapi run() {
      set_name(la, lb, lc);
      return false;
    }
    ea_t la;
    const char *lb;
    int lc;
  };
  execute_ui_requests(new uireq_set_name_t(a, b, c), NULL);
}

static void thread_safe_set_cmt(ea_t a, const char *b, bool c) {
  struct uireq_set_cmt_t: public ui_request_t {
    uireq_set_cmt_t(ea_t a, const char *b, bool c) {
      la = a;
      lb = b;
      lc = c;
    }
    virtual bool idaapi run() {
      set_cmt(la, lb, lc);
      return false;
    }
    ea_t la;
    const char *lb;
    int lc;
  };
  execute_ui_requests(new uireq_set_cmt_t(a, b, c), NULL);
}

static void clear_trail_colors() {
  bgcolor_t white = 0xFFFFFFFF;
  for (size_t i = 0; i < MAX_NUM_COLORS; i++) {
    ea_t addr = trail_addresses[i];
    if (addr != 0) {
      thread_safe_set_item_color(addr, white);
      trail_addresses[i] = 0;
    }
  }
  trail_i = 0;
}

static void add_trail_color(int clnum, ea_t addr) {
  if (trail_i >= MAX_NUM_COLORS) return;
  trail_addresses[trail_i] = addr;
  bgcolor_t color = ((0xFFFF - 4*(MAX_NUM_COLORS - trail_i)) << 8);
  thread_safe_set_item_color(addr, color);
  trail_i++;
}

static void set_trail_colors(char *in) {
  char *dat = (char*)in + sizeof("settrail ") - 1;
  char *token, *clnum_s, *addr_s;

  clear_trail_colors();

  while ((token = strsep(&dat, ";")) != NULL) {
    clnum_s = strsep(&token, ",");
    if (clnum_s == NULL) break;
    addr_s = strsep(&token, ",");
    if (addr_s == NULL) break;
    #ifdef __EA64__
      int clnum = strtoull(clnum_s, NULL, 0);
      ea_t addr = strtoull(addr_s, NULL, 0);
    #else
      int clnum = strtoul(clnum_s, NULL, 0);
      ea_t addr = strtoul(addr_s, NULL, 0);
    #endif
    add_trail_color(clnum, addr);
  }
}

static void set_qira_address(ea_t la) {
  qira_address = la;
}

static void thread_safe_jump_to(ea_t a) {
  struct uireq_jumpto_t: public ui_request_t {
    uireq_jumpto_t(ea_t a) {
      la = a;
    }
    virtual bool idaapi run() {
      if (qira_address != la) {
        set_qira_address(la);
        jumpto(la, -1, 0);  // don't UIJMP_ACTIVATE to not steal focus
      }
      return false;
    }
    ea_t la;
  };
  execute_ui_requests(new uireq_jumpto_t(a), NULL);
}

struct libwebsocket* gwsi = NULL;
struct libwebsocket_context* gcontext = NULL;
struct queue_item *to_send = NULL;

static int callback_qira(struct libwebsocket_context* context,
      struct libwebsocket* wsi,
      enum libwebsocket_callback_reasons reason, void* user,
      void* in, size_t len) {
  //msg("QIRA CALLBACK: %d\n", reason);
  switch(reason) {
    case LWS_CALLBACK_ESTABLISHED:
      // we only support one client
      gwsi = wsi;
      gcontext = context;
      msg("QIRA modern web connected\n");
      break;
    case LWS_CALLBACK_RECEIVE:
      #ifdef DEBUG
        msg("QIRARX:%s\n", (char *)in);
      #endif
      if (memcmp(in, "setaddress ", sizeof("setaddress ")-1) == 0) {
        // untested
        #ifdef __EA64__
          ea_t addr = strtoull((char*)in+sizeof("setaddress ")-1, NULL, 0);
        #else
          ea_t addr = strtoul((char*)in+sizeof("setaddress ")-1, NULL, 0);
        #endif
        thread_safe_jump_to(addr);
      } else if (memcmp(in, "setname ", sizeof("setname ")-1) == 0) {
        char *dat = (char*)in + sizeof("setname ") - 1;

        char *space = strchr(dat, ' ');
        if (space == NULL) {
          report_msg("callback_qira: receieved malformed setname");
          break;
        }
        if (strlen(dat) - strlen(space) <= 1) {
          report_msg("callback_qira: recieved empty setname");
        }
        *space = '\0';
        char *name = space + 1;
        char *addr_s = dat;

        #ifdef __EA64__
          ea_t addr = strtoull(addr_s, NULL, 0);
        #else
          ea_t addr = strtoul(addr_s, NULL, 0);
        #endif
        thread_safe_set_name(addr, name, 0);
      } else if (memcmp(in, "setcmt ", sizeof("setcmt ")-1) == 0) {
        char *dat = (char*)in + sizeof("setcmt ") - 1;

        char *space = strchr(dat, ' ');
        if (space == NULL) {
          msg("callback_qira: receieved malformed setcmt");
          break;
        }
        if (strlen(dat) - strlen(space) <= 1) {
          msg("callback_qira: recieved empty setcmt");
        }
        *space = '\0';
        char *cmt = space + 1;
        char *addr_s = dat;

        #ifdef __EA64__
          ea_t addr = strtoull(addr_s, NULL, 0);
        #else
          ea_t addr = strtoul(addr_s, NULL, 0);
        #endif

        bool repeatable = false;
        thread_safe_set_cmt(addr, cmt, repeatable);
      }
      /*else if (memcmp(in, "settrail ", sizeof("settrail ")-1) == 0) {
        set_trail_colors((char*)in);
      }*/
      break;
    default:
      break;
  }
  return 0;
}

//adds to queue to send asynchronously
static void ws_send(char *str) {
  #ifdef DEBUG
    msg("QIRATX:%s\n", str);
  #endif
  size_t len = strlen(str);
  if (len == 0) return;
  unsigned char *buf = (unsigned char*)
    qalloc(LWS_SEND_BUFFER_PRE_PADDING + len + LWS_SEND_BUFFER_POST_PADDING);
  memcpy(&buf[LWS_SEND_BUFFER_PRE_PADDING], str, len);
  if (enqueue(buf, len) < 0) {
    report_msg("ws_send: failed to enqueue %s\n");
  }
  if (gwsi) {
    while (!lws_send_pipe_choked(gwsi)) {
      if (to_send != NULL) {
        //last thing went through, free it
        qfree(to_send->s);
        qfree(to_send);
      }
      to_send = dequeue();
      if (to_send == NULL)
        break;
      libwebsocket_write(gwsi, &to_send->s[LWS_SEND_BUFFER_PRE_PADDING],
        to_send->len, LWS_WRITE_TEXT);
    }
  }
}


// ***************** IDAPLUGIN *******************

/*
  send the (address, name) pairs back to qira

  IDA prefers to keep names for basic blocks "local" to the function
  so you can reuse the same name (e.g. "loop") in different functions
  therefore basic block names won't sync to qira from IDA

  I was going to include a json library and do some fancy stuff,
  then I realized why not continue the tradition of simple
  format strings?
*/
static void send_names() {
  //max name length with some padding for "setname" and address
  char tmp[MAXNAMELEN + 64];
  for (size_t i = 0; i < get_nlist_size(); i++) {
    #ifdef __EA64__
      qsnprintf(tmp, sizeof(tmp)-1, "setname 0x%llx %s",
        get_nlist_ea(i), get_nlist_name(i));
    #else
      qsnprintf(tmp, sizeof(tmp)-1, "setname 0x%x %s",
        get_nlist_ea(i), get_nlist_name(i));
    #endif
    ws_send(tmp);
  }
}

/*
  IDA does not provide a mechanism to iterate over the comments,
  so we must scan the entire address space. Horrible!
*/
static void send_comments() {
  char cmt_tmp[MAX_COMMENT_LEN-7];
  char tmp[MAX_COMMENT_LEN];
  ssize_t cmt_len;
  ea_t start = get_segm_base(get_first_seg());

  for (ea_t cur = start; cur != BADADDR; cur = nextaddr(cur)) {
    //Do people use repeatable comments?
    cmt_len = get_cmt(cur, false, cmt_tmp, sizeof(cmt_tmp));
    if (cmt_len != -1) {
      #ifdef __EA64__
        qsnprintf(tmp, sizeof(tmp)-1, "setcmt 0x%llx %s", cur, cmt_tmp);
      #else
        qsnprintf(tmp, sizeof(tmp)-1, "setcmt 0x%x %s", cur, cmt_tmp);
      #endif
      ws_send(tmp);
    }
  }
  return;
}

static void update_address(const char *type, ea_t addr) {
  char tmp[100];
  #ifdef __EA64__
    qsnprintf(tmp, sizeof(tmp)-1, "set%s 0x%llx", type, addr);
  #else
    qsnprintf(tmp, sizeof(tmp)-1, "set%s 0x%x", type, addr);
  #endif
  ws_send(tmp);
}

static int idaapi hook(void *user_data, int event_id, va_list va) {
  static ea_t old_addr = 0;
  ea_t addr;
  if (event_id == view_curpos) {
    addr = get_screen_ea();
    if (old_addr != addr) {
      if (isCode(getFlags(addr))) {
        // don't update the address if it's already the qira address
        if (addr != qira_address) {
          set_qira_address(addr);
          update_address("iaddr", addr);
        }
      } else {
        update_address("daddr", addr);
      }
    }
    old_addr = addr;
  }
  return 0;
}

// ***************** WEBSOCKETS BOILERPLATE *******************

static struct libwebsocket_protocols protocols[] = {
  { "http-only", callback_http, 0 },
  { "qira", callback_qira, 0 },
  { NULL, NULL, 0 }
};

qthread_t websockets_thread;
int websockets_running;

int idaapi websocket_thread(void *) {
  struct libwebsocket_context* context;

	struct lws_context_creation_info info;
	memset(&info, 0, sizeof info);
  info.port = 3003;
	info.iface = NULL;
	info.protocols = protocols;
	info.extensions = libwebsocket_get_internal_extensions();
	info.gid = -1;
	info.uid = -1;
	info.options = 0;

  // i assume this does the bind?
  context = libwebsocket_create_context(&info);

  if (context == NULL) {
    msg("websocket init failed\n");
    return -1;
  }

  msg("yay websockets\n");

  while (websockets_running) {
    libwebsocket_service(context, 50);
  }
  libwebsocket_context_destroy(context);
  return 0;
}

void start_websocket_thread() {
  websockets_running = 1;
  websockets_thread = qthread_create(websocket_thread, NULL);
}

void exit_websocket_thread() {
  websockets_running = 0;
  qthread_join(websockets_thread);
}

// ***************** IDAPLUGIN BOILERPLATE *******************

int idaapi IDAP_init(void) {
  hook_to_notification_point(HT_VIEW, hook, NULL);
  init_queue();
  start_websocket_thread();
  return PLUGIN_KEEP;
}

void idaapi IDAP_term(void) {
  unhook_from_notification_point(HT_VIEW, hook);
  exit_websocket_thread();
  destroy_queue();
  return;
}

void idaapi IDAP_run(int arg) {
  msg("manually sending names and comments\n");
  send_names();
  send_comments();
  return;
}

char IDAP_comment[] 	= "QEMU Interactive Runtime Analyser server";
char IDAP_help[] 		= "Visit qira.me for more infos";
char IDAP_name[] 		= "QIRA server";
char IDAP_hotkey[] 	= "Alt-X";

plugin_t PLUGIN = {
  IDP_INTERFACE_VERSION,	// IDA version plug-in is written for
  0,					    // Flags (see below)
  IDAP_init,			// Initialisation function
  IDAP_term,			// Clean-up function
  IDAP_run,				// Main plug-in body
  IDAP_comment,	  // Comment 
  IDAP_help,			// As above
  IDAP_name,			// Plug-in name shown in 
  IDAP_hotkey			// Hot key to run the plug-in
};
