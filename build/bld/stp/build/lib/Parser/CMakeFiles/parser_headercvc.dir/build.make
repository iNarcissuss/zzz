# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/src/github.com/vdun/stoke/stoke/stp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build

# Utility rule file for parser_headercvc.

# Include the progress variables for this target.
include lib/Parser/CMakeFiles/parser_headercvc.dir/progress.make

lib/Parser/CMakeFiles/parser_headercvc: lib/Parser/parsecvc.cpp
lib/Parser/CMakeFiles/parser_headercvc: lib/Parser/lexcvc.cpp

lib/Parser/parsecvc.cpp: ../lib/Parser/cvc.lex
lib/Parser/parsecvc.cpp: ../lib/Parser/cvc.y
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating parsecvc.cpp, lexcvc.cpp"
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/lib/Parser && /usr/bin/bison --debug -v -o /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/lib/Parser/parsecvc.cpp -d -p cvc /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/lib/Parser/cvc.y
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/lib/Parser && /usr/bin/flex -Ce -I -o/home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/lib/Parser/lexcvc.cpp -Pcvc /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/lib/Parser/cvc.lex

lib/Parser/lexcvc.cpp: lib/Parser/parsecvc.cpp

parser_headercvc: lib/Parser/CMakeFiles/parser_headercvc
parser_headercvc: lib/Parser/parsecvc.cpp
parser_headercvc: lib/Parser/lexcvc.cpp
parser_headercvc: lib/Parser/CMakeFiles/parser_headercvc.dir/build.make
.PHONY : parser_headercvc

# Rule to build all files generated by this target.
lib/Parser/CMakeFiles/parser_headercvc.dir/build: parser_headercvc
.PHONY : lib/Parser/CMakeFiles/parser_headercvc.dir/build

lib/Parser/CMakeFiles/parser_headercvc.dir/clean:
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/lib/Parser && $(CMAKE_COMMAND) -P CMakeFiles/parser_headercvc.dir/cmake_clean.cmake
.PHONY : lib/Parser/CMakeFiles/parser_headercvc.dir/clean

lib/Parser/CMakeFiles/parser_headercvc.dir/depend:
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/src/github.com/vdun/stoke/stoke/stp /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/lib/Parser /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/lib/Parser /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/lib/Parser/CMakeFiles/parser_headercvc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/Parser/CMakeFiles/parser_headercvc.dir/depend

