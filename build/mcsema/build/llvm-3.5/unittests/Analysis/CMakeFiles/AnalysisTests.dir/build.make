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
include llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/depend.make

# Include the progress variables for this target.
include llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/progress.make

# Include the compile flags for this target's objects.
include llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/flags.make

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/flags.make
llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o: ../llvm-3.5/unittests/Analysis/CFGTest.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o -c /tmp/mcsema/llvm-3.5/unittests/Analysis/CFGTest.cpp

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/AnalysisTests.dir/CFGTest.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/unittests/Analysis/CFGTest.cpp > CMakeFiles/AnalysisTests.dir/CFGTest.cpp.i

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/AnalysisTests.dir/CFGTest.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/unittests/Analysis/CFGTest.cpp -o CMakeFiles/AnalysisTests.dir/CFGTest.cpp.s

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o.requires:
.PHONY : llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o.requires

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o.provides: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o.requires
	$(MAKE) -f llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/build.make llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o.provides.build
.PHONY : llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o.provides

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o.provides.build: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/flags.make
llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o: ../llvm-3.5/unittests/Analysis/LazyCallGraphTest.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o -c /tmp/mcsema/llvm-3.5/unittests/Analysis/LazyCallGraphTest.cpp

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/unittests/Analysis/LazyCallGraphTest.cpp > CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.i

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/unittests/Analysis/LazyCallGraphTest.cpp -o CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.s

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o.requires:
.PHONY : llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o.requires

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o.provides: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o.requires
	$(MAKE) -f llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/build.make llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o.provides.build
.PHONY : llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o.provides

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o.provides.build: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/flags.make
llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o: ../llvm-3.5/unittests/Analysis/ScalarEvolutionTest.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o -c /tmp/mcsema/llvm-3.5/unittests/Analysis/ScalarEvolutionTest.cpp

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/unittests/Analysis/ScalarEvolutionTest.cpp > CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.i

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/unittests/Analysis/ScalarEvolutionTest.cpp -o CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.s

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o.requires:
.PHONY : llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o.requires

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o.provides: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o.requires
	$(MAKE) -f llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/build.make llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o.provides.build
.PHONY : llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o.provides

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o.provides.build: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/flags.make
llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o: ../llvm-3.5/unittests/Analysis/MixedTBAATest.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o -c /tmp/mcsema/llvm-3.5/unittests/Analysis/MixedTBAATest.cpp

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/unittests/Analysis/MixedTBAATest.cpp > CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.i

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/unittests/Analysis/MixedTBAATest.cpp -o CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.s

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o.requires:
.PHONY : llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o.requires

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o.provides: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o.requires
	$(MAKE) -f llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/build.make llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o.provides.build
.PHONY : llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o.provides

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o.provides.build: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o

# Object files for target AnalysisTests
AnalysisTests_OBJECTS = \
"CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o" \
"CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o" \
"CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o" \
"CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o"

# External object files for target AnalysisTests
AnalysisTests_EXTERNAL_OBJECTS =

llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/build.make
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/lib/libLLVMAnalysis.a
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/lib/libLLVMAsmParser.a
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/lib/libLLVMCore.a
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/lib/libgtest.a
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/lib/libgtest_main.a
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/lib/libLLVMTarget.a
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/lib/libLLVMMC.a
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/lib/libLLVMCore.a
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/lib/libgtest.a
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/unittests/Analysis/AnalysisTests: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable AnalysisTests"
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/AnalysisTests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/build: llvm-3.5/unittests/Analysis/AnalysisTests
.PHONY : llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/build

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/requires: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/CFGTest.cpp.o.requires
llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/requires: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/LazyCallGraphTest.cpp.o.requires
llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/requires: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/ScalarEvolutionTest.cpp.o.requires
llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/requires: llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/MixedTBAATest.cpp.o.requires
.PHONY : llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/requires

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/clean:
	cd /tmp/mcsema/build/llvm-3.5/unittests/Analysis && $(CMAKE_COMMAND) -P CMakeFiles/AnalysisTests.dir/cmake_clean.cmake
.PHONY : llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/clean

llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/depend:
	cd /tmp/mcsema/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/mcsema /tmp/mcsema/llvm-3.5/unittests/Analysis /tmp/mcsema/build /tmp/mcsema/build/llvm-3.5/unittests/Analysis /tmp/mcsema/build/llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : llvm-3.5/unittests/Analysis/CMakeFiles/AnalysisTests.dir/depend

