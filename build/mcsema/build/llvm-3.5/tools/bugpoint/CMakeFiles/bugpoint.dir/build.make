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
include llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/depend.make

# Include the progress variables for this target.
include llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/progress.make

# Include the compile flags for this target's objects.
include llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/flags.make

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/flags.make
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o: ../llvm-3.5/tools/bugpoint/BugDriver.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/bugpoint.dir/BugDriver.cpp.o -c /tmp/mcsema/llvm-3.5/tools/bugpoint/BugDriver.cpp

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bugpoint.dir/BugDriver.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/bugpoint/BugDriver.cpp > CMakeFiles/bugpoint.dir/BugDriver.cpp.i

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bugpoint.dir/BugDriver.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/bugpoint/BugDriver.cpp -o CMakeFiles/bugpoint.dir/BugDriver.cpp.s

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o.requires:
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o.requires

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o.provides: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/build.make llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o.provides.build
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o.provides

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o.provides.build: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/flags.make
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o: ../llvm-3.5/tools/bugpoint/CrashDebugger.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o -c /tmp/mcsema/llvm-3.5/tools/bugpoint/CrashDebugger.cpp

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bugpoint.dir/CrashDebugger.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/bugpoint/CrashDebugger.cpp > CMakeFiles/bugpoint.dir/CrashDebugger.cpp.i

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bugpoint.dir/CrashDebugger.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/bugpoint/CrashDebugger.cpp -o CMakeFiles/bugpoint.dir/CrashDebugger.cpp.s

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o.requires:
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o.requires

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o.provides: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/build.make llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o.provides.build
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o.provides

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o.provides.build: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/flags.make
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o: ../llvm-3.5/tools/bugpoint/ExecutionDriver.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o -c /tmp/mcsema/llvm-3.5/tools/bugpoint/ExecutionDriver.cpp

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/bugpoint/ExecutionDriver.cpp > CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.i

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/bugpoint/ExecutionDriver.cpp -o CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.s

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o.requires:
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o.requires

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o.provides: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/build.make llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o.provides.build
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o.provides

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o.provides.build: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/flags.make
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o: ../llvm-3.5/tools/bugpoint/ExtractFunction.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o -c /tmp/mcsema/llvm-3.5/tools/bugpoint/ExtractFunction.cpp

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bugpoint.dir/ExtractFunction.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/bugpoint/ExtractFunction.cpp > CMakeFiles/bugpoint.dir/ExtractFunction.cpp.i

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bugpoint.dir/ExtractFunction.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/bugpoint/ExtractFunction.cpp -o CMakeFiles/bugpoint.dir/ExtractFunction.cpp.s

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o.requires:
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o.requires

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o.provides: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/build.make llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o.provides.build
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o.provides

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o.provides.build: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/flags.make
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o: ../llvm-3.5/tools/bugpoint/FindBugs.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/bugpoint.dir/FindBugs.cpp.o -c /tmp/mcsema/llvm-3.5/tools/bugpoint/FindBugs.cpp

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bugpoint.dir/FindBugs.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/bugpoint/FindBugs.cpp > CMakeFiles/bugpoint.dir/FindBugs.cpp.i

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bugpoint.dir/FindBugs.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/bugpoint/FindBugs.cpp -o CMakeFiles/bugpoint.dir/FindBugs.cpp.s

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o.requires:
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o.requires

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o.provides: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/build.make llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o.provides.build
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o.provides

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o.provides.build: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/flags.make
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o: ../llvm-3.5/tools/bugpoint/Miscompilation.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/bugpoint.dir/Miscompilation.cpp.o -c /tmp/mcsema/llvm-3.5/tools/bugpoint/Miscompilation.cpp

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bugpoint.dir/Miscompilation.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/bugpoint/Miscompilation.cpp > CMakeFiles/bugpoint.dir/Miscompilation.cpp.i

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bugpoint.dir/Miscompilation.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/bugpoint/Miscompilation.cpp -o CMakeFiles/bugpoint.dir/Miscompilation.cpp.s

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o.requires:
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o.requires

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o.provides: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/build.make llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o.provides.build
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o.provides

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o.provides.build: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/flags.make
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o: ../llvm-3.5/tools/bugpoint/OptimizerDriver.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o -c /tmp/mcsema/llvm-3.5/tools/bugpoint/OptimizerDriver.cpp

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/bugpoint/OptimizerDriver.cpp > CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.i

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/bugpoint/OptimizerDriver.cpp -o CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.s

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o.requires:
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o.requires

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o.provides: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/build.make llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o.provides.build
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o.provides

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o.provides.build: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/flags.make
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o: ../llvm-3.5/tools/bugpoint/ToolRunner.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/bugpoint.dir/ToolRunner.cpp.o -c /tmp/mcsema/llvm-3.5/tools/bugpoint/ToolRunner.cpp

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bugpoint.dir/ToolRunner.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/bugpoint/ToolRunner.cpp > CMakeFiles/bugpoint.dir/ToolRunner.cpp.i

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bugpoint.dir/ToolRunner.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/bugpoint/ToolRunner.cpp -o CMakeFiles/bugpoint.dir/ToolRunner.cpp.s

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o.requires:
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o.requires

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o.provides: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/build.make llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o.provides.build
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o.provides

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o.provides.build: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/flags.make
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o: ../llvm-3.5/tools/bugpoint/bugpoint.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/bugpoint.dir/bugpoint.cpp.o -c /tmp/mcsema/llvm-3.5/tools/bugpoint/bugpoint.cpp

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bugpoint.dir/bugpoint.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/bugpoint/bugpoint.cpp > CMakeFiles/bugpoint.dir/bugpoint.cpp.i

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bugpoint.dir/bugpoint.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/bugpoint/bugpoint.cpp -o CMakeFiles/bugpoint.dir/bugpoint.cpp.s

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o.requires:
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o.requires

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o.provides: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/build.make llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o.provides.build
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o.provides

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o.provides.build: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o

# Object files for target bugpoint
bugpoint_OBJECTS = \
"CMakeFiles/bugpoint.dir/BugDriver.cpp.o" \
"CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o" \
"CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o" \
"CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o" \
"CMakeFiles/bugpoint.dir/FindBugs.cpp.o" \
"CMakeFiles/bugpoint.dir/Miscompilation.cpp.o" \
"CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o" \
"CMakeFiles/bugpoint.dir/ToolRunner.cpp.o" \
"CMakeFiles/bugpoint.dir/bugpoint.cpp.o"

# External object files for target bugpoint
bugpoint_EXTERNAL_OBJECTS =

llvm-3.5/bin/bugpoint: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o
llvm-3.5/bin/bugpoint: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o
llvm-3.5/bin/bugpoint: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o
llvm-3.5/bin/bugpoint: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o
llvm-3.5/bin/bugpoint: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o
llvm-3.5/bin/bugpoint: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o
llvm-3.5/bin/bugpoint: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o
llvm-3.5/bin/bugpoint: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o
llvm-3.5/bin/bugpoint: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o
llvm-3.5/bin/bugpoint: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/build.make
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMAnalysis.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMBitWriter.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMCodeGen.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMCore.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMipa.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMipo.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMIRReader.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMInstCombine.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMInstrumentation.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMLinker.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMObjCARCOpts.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMScalarOpts.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMTarget.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMTransformUtils.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMVectorize.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMInstCombine.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMAsmParser.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMBitReader.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMTransformUtils.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMipa.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMAnalysis.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMTarget.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMCore.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMMC.a
llvm-3.5/bin/bugpoint: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/bin/bugpoint: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/bugpoint"
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bugpoint.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/build: llvm-3.5/bin/bugpoint
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/build

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/requires: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/BugDriver.cpp.o.requires
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/requires: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/CrashDebugger.cpp.o.requires
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/requires: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExecutionDriver.cpp.o.requires
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/requires: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ExtractFunction.cpp.o.requires
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/requires: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/FindBugs.cpp.o.requires
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/requires: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/Miscompilation.cpp.o.requires
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/requires: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/OptimizerDriver.cpp.o.requires
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/requires: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/ToolRunner.cpp.o.requires
llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/requires: llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/bugpoint.cpp.o.requires
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/requires

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/clean:
	cd /tmp/mcsema/build/llvm-3.5/tools/bugpoint && $(CMAKE_COMMAND) -P CMakeFiles/bugpoint.dir/cmake_clean.cmake
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/clean

llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/depend:
	cd /tmp/mcsema/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/mcsema /tmp/mcsema/llvm-3.5/tools/bugpoint /tmp/mcsema/build /tmp/mcsema/build/llvm-3.5/tools/bugpoint /tmp/mcsema/build/llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : llvm-3.5/tools/bugpoint/CMakeFiles/bugpoint.dir/depend

