set(file "/tmp/mcsema/build/mc-sema/Pin-prefix/src/pin-2.14-67254-gcc.4.4.7-linux.tar.gz")
message(STATUS "verifying file...
     file='${file}'")
set(expect_value "4499cfed383f362a0c74560a3ee66a5f117bea95f40067224ddf3c2606c77006")
file(SHA256 "${file}" actual_value)
if("${actual_value}" STREQUAL "${expect_value}")
  message(STATUS "verifying file... done")
else()
  message(FATAL_ERROR "error: SHA256 hash of
  ${file}
does not match expected value
  expected: ${expect_value}
    actual: ${actual_value}
")
endif()
