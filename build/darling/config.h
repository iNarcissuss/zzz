#ifndef CONFIG_H
#define CONFIG_H

#define LIB_PATH "/usr/local/lib/darling"
#define LIBEXEC_PATH "/usr/local/libexec/darling"
#define LIB_DIR_NAME "lib"
#define INSTALL_PREFIX "/usr/local"

#define ETC_DARLING_PATH "/etc/darling"

/* #undef MULTILIB */
/* #undef FRAMEWORK_COREAUDIO */
/* #undef FRAMEWORK_APPKIT */

/*
 * Credit: 
 *
 *    David Chisnall
 *       http://comments.gmane.org/gmane.comp.desktop.etoile.devel/1556
 *
 *       */

#ifdef __block
#       undef __block
#       include <unistd.h>
#       define __block __attribute__((__blocks__(byref)))
#else
#       include <unistd.h>
#endif

#include <stdint.h>

#define __uint64_t uint64_t
/* #define __darwin_natural_t long */


#endif
