#pragma once

#include <boost/config.hpp>

// -------------------------------------------------------------------------- //
// Configuration. Ok to change.
// -------------------------------------------------------------------------- //

/** Enable assertions for all configurations. */
#undef NDEBUG

/** Perform naive recovery of structural types. */
#define NC_STRUCT_RECOVERY

/** Give variables names based on the names of the registers they originate from. */
#define NC_REGISTER_VARIABLE_NAMES

/** Generate constants for constant expressions whenever possible. */
#define NC_PREFER_CONSTANTS_TO_EXPRESSIONS

/** Generate C strings instead of their addresses. */
#define NC_PREFER_CSTRINGS_TO_CONSTANTS

/** Generate references to global variables instead of constants. */
//#define NC_PREFER_GLOBAL_VARIABLES_TO_CONSTANTS

#ifndef NDEBUG
    /** Check LikeC tree after its generation. */
    #define NC_TREE_CHECKS
#endif

/** Use threads. */
#define NC_USE_THREADS

/** Use __cxa_demangle from libiberty (GPL). */
#define NC_WITH_LIBIBERTY

/** Use undname() implementation from Wine (LGPL). */
#define NC_WITH_UNDNAME

// -------------------------------------------------------------------------- //
// Checks. Do not change.
// -------------------------------------------------------------------------- //
#if defined(_MSC_VER) && _MSC_VER < 1600
#  error Your version of Visual Studio is not supported. Please upgrade to Visual Studio 2010 or up.
#endif

// -------------------------------------------------------------------------- //
// Globals. Do not change.
// -------------------------------------------------------------------------- //
/* Disable some bogus warnings. */
#ifdef _MSC_VER
#if _MSC_VER == 1600
#  /* The C++11 standard specifies that the std::hash template shall be declared using the 'struct' keyword
#   * but Visual Studio 2010 Standard C++ Library declares std::hash as a 'class' */
#  pragma warning(disable: 4099) /* C4099: 'identifier' : type name first seen using 'objecttype1'
#                                 * now seen using 'objecttype2'. */
#endif
#if _MSC_VER >= 1800
#  define NC_HAVE_STD_MAKE_UNIQUE
#endif
#  /* We cannot put this pragma in a push-pop block as the actual warning is triggered in
#   * template instantiations. */
#  pragma warning(disable: 4355) /* C4355: 'this' : used in base member initializer list. */
#endif


/* Get GCC version in human-readable format. */
#if defined(__GNUC__) && !defined(__clang__)
#  define GCC_VERSION (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__)
#endif


/* Use C++0x features without changing the syntax! */
#ifndef BOOST_NO_NULLPTR
#  undef NULL
#  define NULL nullptr
#endif


/* Use expression-template-based string concatenation in Qt. */
#define QT_USE_FAST_CONCATENATION
#define QT_USE_FAST_OPERATOR_PLUS


/* Disable override specifier for GCC < 4.7. */
#if defined(GCC_VERSION) && (GCC_VERSION < 40700)
#  define override
#endif

/* Define noexcept as throw() for MSVC and GCC < 4.6. */
#if defined(_MSC_VER)
#  define noexcept throw()
#elif defined(GCC_VERSION) && (GCC_VERSION < 40600)
#  define noexcept throw()
#endif

/**
 * Helpful diagnostic for foreach macro.
 *
 * This definition also doesn't let Qt's foreach to get in.
 */
#define foreach(a, b) YOU_HAVE_FORGOTTEN_TO_INCLUDE_COMMON_FOREACH_H;

/* vim:set et sts=4 sw=4: */
