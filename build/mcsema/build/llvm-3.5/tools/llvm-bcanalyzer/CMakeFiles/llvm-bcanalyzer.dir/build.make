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
include llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/depend.make

# Include the progress variables for this target.
include llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/progress.make

# Include the compile flags for this target's objects.
include llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/flags.make

llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o: llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/flags.make
llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o: ../llvm-3.5/tools/llvm-bcanalyzer/llvm-bcanalyzer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/llvm-bcanalyzer && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o -c /tmp/mcsema/llvm-3.5/tools/llvm-bcanalyzer/llvm-bcanalyzer.cpp

llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/llvm-bcanalyzer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/llvm-bcanalyzer/llvm-bcanalyzer.cpp > CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.i

llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/llvm-bcanalyzer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/llvm-bcanalyzer/llvm-bcanalyzer.cpp -o CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.s

llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.requires:
.PHONY : llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.requires

llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.provides: llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/build.make llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.provides.build
.PHONY : llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.provides

llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.provides.build: llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o

# Object files for target llvm-bcanalyzer
llvm__bcanalyzer_OBJECTS = \
"CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o"

# External object files for target llvm-bcanalyzer
llvm__bcanalyzer_EXTERNAL_OBJECTS =

llvm-3.5/bin/llvm-bcanalyzer: llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o
llvm-3.5/bin/llvm-bcanalyzer: llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/build.make
llvm-3.5/bin/llvm-bcanalyzer: llvm-3.5/lib/libLLVMBitReader.a
llvm-3.5/bin/llvm-bcanalyzer: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/bin/llvm-bcanalyzer: llvm-3.5/lib/libLLVMCore.a
llvm-3.5/bin/llvm-bcanalyzer: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/bin/llvm-bcanalyzer: llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/llvm-bcanalyzer"
	cd /tmp/mcsema/build/llvm-3.5/tools/llvm-bcanalyzer && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llvm-bcanalyzer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/build: llvm-3.5/bin/llvm-bcanalyzer
.PHONY : llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/build

llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/requires: llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.requires
.PHONY : llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/requires

llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/clean:
	cd /tmp/mcsema/build/llvm-3.5/tools/llvm-bcanalyzer && $(CMAKE_COMMAND) -P CMakeFiles/llvm-bcanalyzer.dir/cmake_clean.cmake
.PHONY : llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/clean

llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/depend:
	cd /tmp/mcsema/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/mcsema /tmp/mcsema/llvm-3.5/tools/llvm-bcanalyzer /tmp/mcsema/build /tmp/mcsema/build/llvm-3.5/tools/llvm-bcanalyzer /tmp/mcsema/build/llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : llvm-3.5/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/depend

