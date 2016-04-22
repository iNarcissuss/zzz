FILE(REMOVE_RECURSE
  "CMakeFiles/Pin"
  "CMakeFiles/Pin-complete"
  "Pin-prefix/src/Pin-stamp/Pin-install"
  "Pin-prefix/src/Pin-stamp/Pin-mkdir"
  "Pin-prefix/src/Pin-stamp/Pin-download"
  "Pin-prefix/src/Pin-stamp/Pin-update"
  "Pin-prefix/src/Pin-stamp/Pin-patch"
  "Pin-prefix/src/Pin-stamp/Pin-configure"
  "Pin-prefix/src/Pin-stamp/Pin-build"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/Pin.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
