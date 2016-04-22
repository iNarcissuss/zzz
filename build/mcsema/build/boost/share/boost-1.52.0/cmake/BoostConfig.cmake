#
# Copyright (C) Troy D. Straszheim
#
# Distributed under the Boost Software License, Version 1.0.
# See accompanying file LICENSE_1_0.txt or copy at
#   http://www.boost.org/LICENSE_1_0.txt
#

#
# This file is generated by cmake and installed to 
# BOOST_VERSIONED_CMAKE_FILES_DIR/Boost-1.52.0.
# 
# when a users does a find_package(Boost ...) BoostConfigVersion.cmake
# and BoostVersion.cmake will search for this file.
#

#
#  Various variables
#
set(Boost_VERSION "1.52.0")
set(Boost_INCLUDE_DIRS "${Boost_INCLUDE_DIR}")
set(Boost_INCLUDE_DIR "/tmp/mcsema/build/boost/include/boost-1.52.0"
  CACHE FILEPATH "Boost include directory")
set(Boost_LIBRARY_DIRS "/tmp/mcsema/build/boost/lib/boost-1.52.0")
#
#  Include the imported targets
#
include("/tmp/mcsema/build/boost/lib/boost-1.52.0/Boost.cmake")

#
#  Calculate target suffix from user variables
#
if (NOT DEFINED Boost_USE_MULTITHREADED)
  set(Boost_USE_MULTITHREADED TRUE)
endif()


if (Boost_USE_MULTITHREADED)
  set(mtflag "-mt")
  set(mtdesc "multi-threaded")
else()
  set(mtflag "")
  set(mtdesc "single-threaded")
endif()

if (Boost_USE_STATIC)
  set(staticflag "-static")
  set(staticdesc "statically-linked")
else()
  set(staticflag "-shared")
  set(staticdesc "dynamically-linked")
endif()

set(Boost_LIBRARIES "")
if (NOT Boost_FIND_COMPONENTS)
  set(Boost_FIND_COMPONENTS "program_options;filesystem;system;thread;date_time")
endif()

foreach(component ${Boost_FIND_COMPONENTS})
  #
  # Check that it is really a target
  # 
  set(target boost_${component}${mtflag}${staticflag})
  get_target_property(p_optimized ${target} TYPE)
  get_target_property(p_debug ${target}-debug TYPE)

  # If optimized and debug versions are installed, specify each
  if (p_optimized MATCHES "_LIBRARY$" AND p_debug MATCHES "_LIBRARY$")
    list(APPEND Boost_LIBRARIES "optimized;${target};debug;${target}-debug")
  else()
    # Otherwise use whatever is available
    if (p_optimized MATCHES "_LIBRARY$")
      list(APPEND Boost_LIBRARIES "${target}")
    else()
      if (p_debug MATCHES "_LIBRARY$")
        list(APPEND Boost_LIBRARIES "${target}-debug")
      else()
        list(APPEND Boost_MISSING ${component})
      endif()
    endif()
  endif()

endforeach()

# Crude error handling (TODO: proper handling of REQUIRED etc)
if (Boost_MISSING)
  message(FATAL_ERROR "Boost components not found: ${Boost_MISSING}")
endif()

