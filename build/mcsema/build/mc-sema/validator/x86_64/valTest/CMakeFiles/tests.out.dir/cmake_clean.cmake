FILE(REMOVE_RECURSE
  "CMakeFiles/tests.out"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/tests.out.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
