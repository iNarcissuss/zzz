FILE(REMOVE_RECURSE
  "CMakeFiles/boost"
  "CMakeFiles/boost-complete"
  "boost-prefix/src/boost-stamp/boost-install"
  "boost-prefix/src/boost-stamp/boost-mkdir"
  "boost-prefix/src/boost-stamp/boost-download"
  "boost-prefix/src/boost-stamp/boost-update"
  "boost-prefix/src/boost-stamp/boost-patch"
  "boost-prefix/src/boost-stamp/boost-configure"
  "boost-prefix/src/boost-stamp/boost-build"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/boost.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
