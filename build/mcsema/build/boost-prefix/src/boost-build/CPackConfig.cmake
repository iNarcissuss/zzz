# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


SET(CPACK_BINARY_BUNDLE "")
SET(CPACK_BINARY_CYGWIN "")
SET(CPACK_BINARY_DEB "OFF")
SET(CPACK_BINARY_DRAGNDROP "")
SET(CPACK_BINARY_NSIS "OFF")
SET(CPACK_BINARY_OSXX11 "")
SET(CPACK_BINARY_PACKAGEMAKER "")
SET(CPACK_BINARY_RPM "OFF")
SET(CPACK_BINARY_STGZ "ON")
SET(CPACK_BINARY_TBZ2 "OFF")
SET(CPACK_BINARY_TGZ "ON")
SET(CPACK_BINARY_TZ "ON")
SET(CPACK_BINARY_WIX "")
SET(CPACK_BINARY_ZIP "")
SET(CPACK_CMAKE_GENERATOR "Unix Makefiles")
SET(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
SET(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
SET(CPACK_GENERATOR "STGZ;TGZ;TZ")
SET(CPACK_INSTALL_CMAKE_PROJECTS "/tmp/mcsema/build/boost-prefix/src/boost-build;Boost;ALL;/")
SET(CPACK_INSTALL_PREFIX "/tmp/mcsema/build/boost")
SET(CPACK_MODULE_PATH "/tmp/mcsema/boost/tools/build/CMake")
SET(CPACK_NSIS_DISPLAY_NAME "Boost")
SET(CPACK_NSIS_INSTALLER_ICON_CODE "")
SET(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
SET(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES")
SET(CPACK_NSIS_PACKAGE_NAME "Boost")
SET(CPACK_OUTPUT_CONFIG_FILE "/tmp/mcsema/build/boost-prefix/src/boost-build/CPackConfig.cmake")
SET(CPACK_PACKAGE_DEFAULT_LOCATION "/")
SET(CPACK_PACKAGE_DESCRIPTION_FILE "/usr/share/cmake-2.8/Templates/CPack.GenericDescription.txt")
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Boost 1.52.0 prerelease")
SET(CPACK_PACKAGE_FILE_NAME "boost-1.52.0-linux-gcc48")
SET(CPACK_PACKAGE_INSTALL_DIRECTORY "Boost")
SET(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "Boost")
SET(CPACK_PACKAGE_NAME "Boost")
SET(CPACK_PACKAGE_RELOCATABLE "true")
SET(CPACK_PACKAGE_VENDOR "Boost.org")
SET(CPACK_PACKAGE_VERSION "1.52.0")
SET(CPACK_PACKAGE_VERSION_MAJOR "1")
SET(CPACK_PACKAGE_VERSION_MINOR "52")
SET(CPACK_PACKAGE_VERSION_PATCH "0")
SET(CPACK_RESOURCE_FILE_LICENSE "/tmp/mcsema/boost/LICENSE_1_0.txt")
SET(CPACK_RESOURCE_FILE_README "/usr/share/cmake-2.8/Templates/CPack.GenericDescription.txt")
SET(CPACK_RESOURCE_FILE_WELCOME "/usr/share/cmake-2.8/Templates/CPack.GenericWelcome.txt")
SET(CPACK_SET_DESTDIR "OFF")
SET(CPACK_SOURCE_CYGWIN "")
SET(CPACK_SOURCE_GENERATOR "TGZ;TBZ2;TZ")
SET(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/tmp/mcsema/build/boost-prefix/src/boost-build/CPackSourceConfig.cmake")
SET(CPACK_SOURCE_TBZ2 "ON")
SET(CPACK_SOURCE_TGZ "ON")
SET(CPACK_SOURCE_TZ "ON")
SET(CPACK_SOURCE_ZIP "OFF")
SET(CPACK_SYSTEM_NAME "Linux")
SET(CPACK_TOPLEVEL_TAG "Linux")
SET(CPACK_WIX_SIZEOF_VOID_P "8")

# Configuration for component group "date_time"
set(CPACK_COMPONENT_GROUP_DATE_TIME_DISPLAY_NAME "date_time")
set(CPACK_COMPONENT_GROUP_DATE_TIME_DESCRIPTION "Boost.date_time

A set of date-time libraries based on generic programming concepts.

Author: Jeff Garland <jeff@crystalclearsoftware.com>")

# Configuration for component "date_time_headers"

SET(CPACK_COMPONENTS_ALL Unspecified)
set(CPACK_COMPONENT_DATE_TIME_HEADERS_DISPLAY_NAME "Header files")
set(CPACK_COMPONENT_DATE_TIME_HEADERS_GROUP date_time)
set(CPACK_COMPONENT_DATE_TIME_HEADERS_DEPENDS algorithm_headers smart_ptr_headers tokenizer_headers io_headers bind_headers)

# Configuration for component "date_time_mt_static"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_DATE_TIME_MT_STATIC_DISPLAY_NAME "Static, multi-threaded, release")
set(CPACK_COMPONENT_DATE_TIME_MT_STATIC_GROUP date_time)

# Configuration for component "date_time_mt_static_debug"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_DATE_TIME_MT_STATIC_DEBUG_DISPLAY_NAME "Static, multi-threaded, debug")
set(CPACK_COMPONENT_DATE_TIME_MT_STATIC_DEBUG_GROUP date_time)

# Configuration for component group "thread"
set(CPACK_COMPONENT_GROUP_THREAD_DISPLAY_NAME "thread")
set(CPACK_COMPONENT_GROUP_THREAD_DESCRIPTION "Boost.thread

Boost.Thread")

# Configuration for component "thread_headers"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_THREAD_HEADERS_DISPLAY_NAME "Header files")
set(CPACK_COMPONENT_THREAD_HEADERS_GROUP thread)
set(CPACK_COMPONENT_THREAD_HEADERS_DEPENDS date_time_headers bind_headers optional_headers range_headers)

# Configuration for component "thread_mt_static"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_THREAD_MT_STATIC_DISPLAY_NAME "Static, multi-threaded, release")
set(CPACK_COMPONENT_THREAD_MT_STATIC_GROUP thread)

# Configuration for component "thread_mt_static_debug"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_THREAD_MT_STATIC_DEBUG_DISPLAY_NAME "Static, multi-threaded, debug")
set(CPACK_COMPONENT_THREAD_MT_STATIC_DEBUG_GROUP thread)

# Configuration for component group "system"
set(CPACK_COMPONENT_GROUP_SYSTEM_DISPLAY_NAME "system")

# Configuration for component "system_headers"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_SYSTEM_HEADERS_DISPLAY_NAME "Header files")
set(CPACK_COMPONENT_SYSTEM_HEADERS_GROUP system)
set(CPACK_COMPONENT_SYSTEM_HEADERS_DEPENDS utility_headers)

# Configuration for component "system_mt_static"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_SYSTEM_MT_STATIC_DISPLAY_NAME "Static, multi-threaded, release")
set(CPACK_COMPONENT_SYSTEM_MT_STATIC_GROUP system)

# Configuration for component "system_mt_static_debug"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_SYSTEM_MT_STATIC_DEBUG_DISPLAY_NAME "Static, multi-threaded, debug")
set(CPACK_COMPONENT_SYSTEM_MT_STATIC_DEBUG_GROUP system)

# Configuration for component group "filesystem"
set(CPACK_COMPONENT_GROUP_FILESYSTEM_DISPLAY_NAME "filesystem")
set(CPACK_COMPONENT_GROUP_FILESYSTEM_DESCRIPTION "Boost.filesystem

Provides portable facilities to query and manipulate paths, files, and directories. Note: the default version is now v3: v2 is no longer distributed.

Author: Beman Dawes <bdawes@acm.org>")

# Configuration for component "filesystem_headers"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_FILESYSTEM_HEADERS_DISPLAY_NAME "Header files")
set(CPACK_COMPONENT_FILESYSTEM_HEADERS_GROUP filesystem)
set(CPACK_COMPONENT_FILESYSTEM_HEADERS_DEPENDS system_headers smart_ptr_headers)

# Configuration for component "filesystem_mt_static"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_FILESYSTEM_MT_STATIC_DISPLAY_NAME "Static, multi-threaded, release")
set(CPACK_COMPONENT_FILESYSTEM_MT_STATIC_GROUP filesystem)

# Configuration for component "filesystem_mt_static_debug"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_FILESYSTEM_MT_STATIC_DEBUG_DISPLAY_NAME "Static, multi-threaded, debug")
set(CPACK_COMPONENT_FILESYSTEM_MT_STATIC_DEBUG_GROUP filesystem)

# Configuration for component group "program_options"
set(CPACK_COMPONENT_GROUP_PROGRAM_OPTIONS_DISPLAY_NAME "program_options")
set(CPACK_COMPONENT_GROUP_PROGRAM_OPTIONS_DESCRIPTION "Boost.program_options

Access to configuration data given on command line, in config files and other sources.

Author: Vladimir Prus <ghost@cs.msu.su>")

# Configuration for component "program_options_headers"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_PROGRAM_OPTIONS_HEADERS_DISPLAY_NAME "Header files")
set(CPACK_COMPONENT_PROGRAM_OPTIONS_HEADERS_GROUP program_options)
set(CPACK_COMPONENT_PROGRAM_OPTIONS_HEADERS_DEPENDS any_headers bind_headers smart_ptr_headers test_headers tokenizer_headers)

# Configuration for component "program_options_mt_static"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_PROGRAM_OPTIONS_MT_STATIC_DISPLAY_NAME "Static, multi-threaded, release")
set(CPACK_COMPONENT_PROGRAM_OPTIONS_MT_STATIC_GROUP program_options)

# Configuration for component "program_options_mt_static_debug"

SET(CPACK_COMPONENTS_ALL Boost Unspecified)
set(CPACK_COMPONENT_PROGRAM_OPTIONS_MT_STATIC_DEBUG_DISPLAY_NAME "Static, multi-threaded, debug")
set(CPACK_COMPONENT_PROGRAM_OPTIONS_MT_STATIC_DEBUG_GROUP program_options)
