message(STATUS "downloading...
     src='http://software.intel.com/sites/landingpage/pintool/downloads/pin-2.14-67254-gcc.4.4.7-linux.tar.gz'
     dst='/tmp/mcsema/build/mc-sema/Pin-prefix/src/pin-2.14-67254-gcc.4.4.7-linux.tar.gz'
     timeout='none'")




file(DOWNLOAD
  "http://software.intel.com/sites/landingpage/pintool/downloads/pin-2.14-67254-gcc.4.4.7-linux.tar.gz"
  "/tmp/mcsema/build/mc-sema/Pin-prefix/src/pin-2.14-67254-gcc.4.4.7-linux.tar.gz"
  SHOW_PROGRESS
  EXPECTED_HASH;SHA256=4499cfed383f362a0c74560a3ee66a5f117bea95f40067224ddf3c2606c77006
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'http://software.intel.com/sites/landingpage/pintool/downloads/pin-2.14-67254-gcc.4.4.7-linux.tar.gz' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
