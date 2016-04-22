#----------------------------------------------------------------
# Generated CMake target import file for configuration "".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "boost_date_time-mt-static" for configuration ""
set_property(TARGET boost_date_time-mt-static APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(boost_date_time-mt-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "pthread;rt"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_date_time-mt.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost_date_time-mt-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost_date_time-mt-static "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_date_time-mt.a" )

# Import target "boost_date_time-mt-static-debug" for configuration ""
set_property(TARGET boost_date_time-mt-static-debug APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(boost_date_time-mt-static-debug PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "pthread;rt"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_date_time-mt-d.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost_date_time-mt-static-debug )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost_date_time-mt-static-debug "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_date_time-mt-d.a" )

# Import target "boost_thread-mt-static" for configuration ""
set_property(TARGET boost_thread-mt-static APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(boost_thread-mt-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "pthread;rt"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_thread-mt.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost_thread-mt-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost_thread-mt-static "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_thread-mt.a" )

# Import target "boost_thread-mt-static-debug" for configuration ""
set_property(TARGET boost_thread-mt-static-debug APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(boost_thread-mt-static-debug PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "pthread;rt"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_thread-mt-d.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost_thread-mt-static-debug )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost_thread-mt-static-debug "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_thread-mt-d.a" )

# Import target "boost_system-mt-static" for configuration ""
set_property(TARGET boost_system-mt-static APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(boost_system-mt-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "pthread;rt"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_system-mt.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost_system-mt-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost_system-mt-static "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_system-mt.a" )

# Import target "boost_system-mt-static-debug" for configuration ""
set_property(TARGET boost_system-mt-static-debug APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(boost_system-mt-static-debug PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "pthread;rt"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_system-mt-d.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost_system-mt-static-debug )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost_system-mt-static-debug "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_system-mt-d.a" )

# Import target "boost_filesystem-mt-static" for configuration ""
set_property(TARGET boost_filesystem-mt-static APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(boost_filesystem-mt-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "pthread;rt;boost_system-mt-static"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_filesystem-mt.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost_filesystem-mt-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost_filesystem-mt-static "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_filesystem-mt.a" )

# Import target "boost_filesystem-mt-static-debug" for configuration ""
set_property(TARGET boost_filesystem-mt-static-debug APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(boost_filesystem-mt-static-debug PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "pthread;rt;boost_system-mt-static-debug"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_filesystem-mt-d.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost_filesystem-mt-static-debug )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost_filesystem-mt-static-debug "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_filesystem-mt-d.a" )

# Import target "boost_program_options-mt-static" for configuration ""
set_property(TARGET boost_program_options-mt-static APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(boost_program_options-mt-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "pthread;rt"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_program_options-mt.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost_program_options-mt-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost_program_options-mt-static "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_program_options-mt.a" )

# Import target "boost_program_options-mt-static-debug" for configuration ""
set_property(TARGET boost_program_options-mt-static-debug APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(boost_program_options-mt-static-debug PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "pthread;rt"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_program_options-mt-d.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost_program_options-mt-static-debug )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost_program_options-mt-static-debug "${_IMPORT_PREFIX}/lib/boost-1.52.0/libboost_program_options-mt-d.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
