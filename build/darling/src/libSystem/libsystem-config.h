

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
#define __darwin_natural_t long

/* #undef HAS_BSD_WCHAR_H */
