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
include llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/depend.make

# Include the progress variables for this target.
include llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/progress.make

# Include the compile flags for this target's objects.
include llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/flags.make

llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o: llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/flags.make
llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o: ../llvm-3.5/unittests/Transforms/DebugIR/DebugIR.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Transforms/DebugIR && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o -c /tmp/mcsema/llvm-3.5/unittests/Transforms/DebugIR/DebugIR.cpp

llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DebugIRTests.dir/DebugIR.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Transforms/DebugIR && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/unittests/Transforms/DebugIR/DebugIR.cpp > CMakeFiles/DebugIRTests.dir/DebugIR.cpp.i

llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DebugIRTests.dir/DebugIR.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Transforms/DebugIR && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/unittests/Transforms/DebugIR/DebugIR.cpp -o CMakeFiles/DebugIRTests.dir/DebugIR.cpp.s

llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o.requires:
.PHONY : llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o.requires

llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o.provides: llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o.requires
	$(MAKE) -f llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/build.make llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o.provides.build
.PHONY : llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o.provides

llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o.provides.build: llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o

# Object files for target DebugIRTests
DebugIRTests_OBJECTS = \
"CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o"

# External object files for target DebugIRTests
DebugIRTests_EXTERNAL_OBJECTS =

llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/build.make
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libLLVMCore.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libLLVMInstrumentation.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libgtest.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libgtest_main.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libLLVMTransformUtils.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libLLVMipa.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libLLVMAnalysis.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libLLVMTarget.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libLLVMCore.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libLLVMMC.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libgtest.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests: llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable DebugIRTests"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Transforms/DebugIR && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DebugIRTests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/build: llvm-3.5/unittests/Transforms/DebugIR/DebugIRTests
.PHONY : llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/build

llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/requires: llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DebugIR.cpp.o.requires
.PHONY : llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/requires

llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/clean:
	cd /tmp/mcsema/build/llvm-3.5/unittests/Transforms/DebugIR && $(CMAKE_COMMAND) -P CMakeFiles/DebugIRTests.dir/cmake_clean.cmake
.PHONY : llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/clean

llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/depend:
	cd /tmp/mcsema/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/mcsema /tmp/mcsema/llvm-3.5/unittests/Transforms/DebugIR /tmp/mcsema/build /tmp/mcsema/build/llvm-3.5/unittests/Transforms/DebugIR /tmp/mcsema/build/llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : llvm-3.5/unittests/Transforms/DebugIR/CMakeFiles/DebugIRTests.dir/depend

