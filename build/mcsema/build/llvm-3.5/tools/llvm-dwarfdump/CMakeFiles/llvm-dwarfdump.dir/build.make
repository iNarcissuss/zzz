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
include llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/depend.make

# Include the progress variables for this target.
include llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/progress.make

# Include the compile flags for this target's objects.
include llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/flags.make

llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o: llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/flags.make
llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o: ../llvm-3.5/tools/llvm-dwarfdump/llvm-dwarfdump.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/llvm-dwarfdump && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o -c /tmp/mcsema/llvm-3.5/tools/llvm-dwarfdump/llvm-dwarfdump.cpp

llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/llvm-dwarfdump && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/llvm-dwarfdump/llvm-dwarfdump.cpp > CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.i

llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/llvm-dwarfdump && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/llvm-dwarfdump/llvm-dwarfdump.cpp -o CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.s

llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o.requires:
.PHONY : llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o.requires

llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o.provides: llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/build.make llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o.provides.build
.PHONY : llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o.provides

llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o.provides.build: llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o

# Object files for target llvm-dwarfdump
llvm__dwarfdump_OBJECTS = \
"CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o"

# External object files for target llvm-dwarfdump
llvm__dwarfdump_EXTERNAL_OBJECTS =

llvm-3.5/bin/llvm-dwarfdump: llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o
llvm-3.5/bin/llvm-dwarfdump: llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/build.make
llvm-3.5/bin/llvm-dwarfdump: llvm-3.5/lib/libLLVMDebugInfo.a
llvm-3.5/bin/llvm-dwarfdump: llvm-3.5/lib/libLLVMObject.a
llvm-3.5/bin/llvm-dwarfdump: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/bin/llvm-dwarfdump: llvm-3.5/lib/libLLVMBitReader.a
llvm-3.5/bin/llvm-dwarfdump: llvm-3.5/lib/libLLVMCore.a
llvm-3.5/bin/llvm-dwarfdump: llvm-3.5/lib/libLLVMMCParser.a
llvm-3.5/bin/llvm-dwarfdump: llvm-3.5/lib/libLLVMMC.a
llvm-3.5/bin/llvm-dwarfdump: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/bin/llvm-dwarfdump: llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/llvm-dwarfdump"
	cd /tmp/mcsema/build/llvm-3.5/tools/llvm-dwarfdump && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llvm-dwarfdump.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/build: llvm-3.5/bin/llvm-dwarfdump
.PHONY : llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/build

llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/requires: llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/llvm-dwarfdump.cpp.o.requires
.PHONY : llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/requires

llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/clean:
	cd /tmp/mcsema/build/llvm-3.5/tools/llvm-dwarfdump && $(CMAKE_COMMAND) -P CMakeFiles/llvm-dwarfdump.dir/cmake_clean.cmake
.PHONY : llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/clean

llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/depend:
	cd /tmp/mcsema/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/mcsema /tmp/mcsema/llvm-3.5/tools/llvm-dwarfdump /tmp/mcsema/build /tmp/mcsema/build/llvm-3.5/tools/llvm-dwarfdump /tmp/mcsema/build/llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : llvm-3.5/tools/llvm-dwarfdump/CMakeFiles/llvm-dwarfdump.dir/depend

