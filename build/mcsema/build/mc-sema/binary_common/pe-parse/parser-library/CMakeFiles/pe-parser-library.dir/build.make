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
CMAKE_SOURCE_DIR = /tmp/mcsema

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /tmp/mcsema/build

# Include any dependencies generated for this target.
include mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/depend.make

# Include the progress variables for this target.
include mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/progress.make

# Include the compile flags for this target's objects.
include mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/flags.make

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o: mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/flags.make
mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o: ../mc-sema/binary_common/pe-parse/parser-library/buffer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o"
	cd /tmp/mcsema/build/mc-sema/binary_common/pe-parse/parser-library && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/pe-parser-library.dir/buffer.cpp.o -c /tmp/mcsema/mc-sema/binary_common/pe-parse/parser-library/buffer.cpp

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pe-parser-library.dir/buffer.cpp.i"
	cd /tmp/mcsema/build/mc-sema/binary_common/pe-parse/parser-library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/mc-sema/binary_common/pe-parse/parser-library/buffer.cpp > CMakeFiles/pe-parser-library.dir/buffer.cpp.i

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pe-parser-library.dir/buffer.cpp.s"
	cd /tmp/mcsema/build/mc-sema/binary_common/pe-parse/parser-library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/mc-sema/binary_common/pe-parse/parser-library/buffer.cpp -o CMakeFiles/pe-parser-library.dir/buffer.cpp.s

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o.requires:
.PHONY : mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o.requires

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o.provides: mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o.requires
	$(MAKE) -f mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/build.make mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o.provides.build
.PHONY : mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o.provides

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o.provides.build: mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o: mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/flags.make
mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o: ../mc-sema/binary_common/pe-parse/parser-library/parse.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o"
	cd /tmp/mcsema/build/mc-sema/binary_common/pe-parse/parser-library && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/pe-parser-library.dir/parse.cpp.o -c /tmp/mcsema/mc-sema/binary_common/pe-parse/parser-library/parse.cpp

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pe-parser-library.dir/parse.cpp.i"
	cd /tmp/mcsema/build/mc-sema/binary_common/pe-parse/parser-library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/mc-sema/binary_common/pe-parse/parser-library/parse.cpp > CMakeFiles/pe-parser-library.dir/parse.cpp.i

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pe-parser-library.dir/parse.cpp.s"
	cd /tmp/mcsema/build/mc-sema/binary_common/pe-parse/parser-library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/mc-sema/binary_common/pe-parse/parser-library/parse.cpp -o CMakeFiles/pe-parser-library.dir/parse.cpp.s

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o.requires:
.PHONY : mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o.requires

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o.provides: mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o.requires
	$(MAKE) -f mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/build.make mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o.provides.build
.PHONY : mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o.provides

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o.provides.build: mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o

# Object files for target pe-parser-library
pe__parser__library_OBJECTS = \
"CMakeFiles/pe-parser-library.dir/buffer.cpp.o" \
"CMakeFiles/pe-parser-library.dir/parse.cpp.o"

# External object files for target pe-parser-library
pe__parser__library_EXTERNAL_OBJECTS =

mc-sema/binary_common/pe-parse/parser-library/libpe-parser-library.a: mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o
mc-sema/binary_common/pe-parse/parser-library/libpe-parser-library.a: mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o
mc-sema/binary_common/pe-parse/parser-library/libpe-parser-library.a: mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/build.make
mc-sema/binary_common/pe-parse/parser-library/libpe-parser-library.a: mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libpe-parser-library.a"
	cd /tmp/mcsema/build/mc-sema/binary_common/pe-parse/parser-library && $(CMAKE_COMMAND) -P CMakeFiles/pe-parser-library.dir/cmake_clean_target.cmake
	cd /tmp/mcsema/build/mc-sema/binary_common/pe-parse/parser-library && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pe-parser-library.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/build: mc-sema/binary_common/pe-parse/parser-library/libpe-parser-library.a
.PHONY : mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/build

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/requires: mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/buffer.cpp.o.requires
mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/requires: mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/parse.cpp.o.requires
.PHONY : mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/requires

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/clean:
	cd /tmp/mcsema/build/mc-sema/binary_common/pe-parse/parser-library && $(CMAKE_COMMAND) -P CMakeFiles/pe-parser-library.dir/cmake_clean.cmake
.PHONY : mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/clean

mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/depend:
	cd /tmp/mcsema/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/mcsema /tmp/mcsema/mc-sema/binary_common/pe-parse/parser-library /tmp/mcsema/build /tmp/mcsema/build/mc-sema/binary_common/pe-parse/parser-library /tmp/mcsema/build/mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : mc-sema/binary_common/pe-parse/parser-library/CMakeFiles/pe-parser-library.dir/depend

