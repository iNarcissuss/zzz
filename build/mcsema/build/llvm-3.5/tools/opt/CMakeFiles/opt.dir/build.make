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
include llvm-3.5/tools/opt/CMakeFiles/opt.dir/depend.make

# Include the progress variables for this target.
include llvm-3.5/tools/opt/CMakeFiles/opt.dir/progress.make

# Include the compile flags for this target's objects.
include llvm-3.5/tools/opt/CMakeFiles/opt.dir/flags.make

llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o: llvm-3.5/tools/opt/CMakeFiles/opt.dir/flags.make
llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o: ../llvm-3.5/tools/opt/AnalysisWrappers.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opt.dir/AnalysisWrappers.cpp.o -c /tmp/mcsema/llvm-3.5/tools/opt/AnalysisWrappers.cpp

llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opt.dir/AnalysisWrappers.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/opt/AnalysisWrappers.cpp > CMakeFiles/opt.dir/AnalysisWrappers.cpp.i

llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opt.dir/AnalysisWrappers.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/opt/AnalysisWrappers.cpp -o CMakeFiles/opt.dir/AnalysisWrappers.cpp.s

llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o.requires:
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o.requires

llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o.provides: llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/opt/CMakeFiles/opt.dir/build.make llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o.provides.build
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o.provides

llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o.provides.build: llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o

llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o: llvm-3.5/tools/opt/CMakeFiles/opt.dir/flags.make
llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o: ../llvm-3.5/tools/opt/BreakpointPrinter.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opt.dir/BreakpointPrinter.cpp.o -c /tmp/mcsema/llvm-3.5/tools/opt/BreakpointPrinter.cpp

llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opt.dir/BreakpointPrinter.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/opt/BreakpointPrinter.cpp > CMakeFiles/opt.dir/BreakpointPrinter.cpp.i

llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opt.dir/BreakpointPrinter.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/opt/BreakpointPrinter.cpp -o CMakeFiles/opt.dir/BreakpointPrinter.cpp.s

llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o.requires:
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o.requires

llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o.provides: llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/opt/CMakeFiles/opt.dir/build.make llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o.provides.build
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o.provides

llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o.provides.build: llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o

llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o: llvm-3.5/tools/opt/CMakeFiles/opt.dir/flags.make
llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o: ../llvm-3.5/tools/opt/GraphPrinters.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opt.dir/GraphPrinters.cpp.o -c /tmp/mcsema/llvm-3.5/tools/opt/GraphPrinters.cpp

llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opt.dir/GraphPrinters.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/opt/GraphPrinters.cpp > CMakeFiles/opt.dir/GraphPrinters.cpp.i

llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opt.dir/GraphPrinters.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/opt/GraphPrinters.cpp -o CMakeFiles/opt.dir/GraphPrinters.cpp.s

llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o.requires:
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o.requires

llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o.provides: llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/opt/CMakeFiles/opt.dir/build.make llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o.provides.build
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o.provides

llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o.provides.build: llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o

llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o: llvm-3.5/tools/opt/CMakeFiles/opt.dir/flags.make
llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o: ../llvm-3.5/tools/opt/NewPMDriver.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opt.dir/NewPMDriver.cpp.o -c /tmp/mcsema/llvm-3.5/tools/opt/NewPMDriver.cpp

llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opt.dir/NewPMDriver.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/opt/NewPMDriver.cpp > CMakeFiles/opt.dir/NewPMDriver.cpp.i

llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opt.dir/NewPMDriver.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/opt/NewPMDriver.cpp -o CMakeFiles/opt.dir/NewPMDriver.cpp.s

llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o.requires:
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o.requires

llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o.provides: llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/opt/CMakeFiles/opt.dir/build.make llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o.provides.build
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o.provides

llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o.provides.build: llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o

llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o: llvm-3.5/tools/opt/CMakeFiles/opt.dir/flags.make
llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o: ../llvm-3.5/tools/opt/Passes.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opt.dir/Passes.cpp.o -c /tmp/mcsema/llvm-3.5/tools/opt/Passes.cpp

llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opt.dir/Passes.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/opt/Passes.cpp > CMakeFiles/opt.dir/Passes.cpp.i

llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opt.dir/Passes.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/opt/Passes.cpp -o CMakeFiles/opt.dir/Passes.cpp.s

llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o.requires:
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o.requires

llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o.provides: llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/opt/CMakeFiles/opt.dir/build.make llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o.provides.build
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o.provides

llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o.provides.build: llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o

llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o: llvm-3.5/tools/opt/CMakeFiles/opt.dir/flags.make
llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o: ../llvm-3.5/tools/opt/PassPrinters.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opt.dir/PassPrinters.cpp.o -c /tmp/mcsema/llvm-3.5/tools/opt/PassPrinters.cpp

llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opt.dir/PassPrinters.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/opt/PassPrinters.cpp > CMakeFiles/opt.dir/PassPrinters.cpp.i

llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opt.dir/PassPrinters.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/opt/PassPrinters.cpp -o CMakeFiles/opt.dir/PassPrinters.cpp.s

llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o.requires:
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o.requires

llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o.provides: llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/opt/CMakeFiles/opt.dir/build.make llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o.provides.build
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o.provides

llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o.provides.build: llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o

llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o: llvm-3.5/tools/opt/CMakeFiles/opt.dir/flags.make
llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o: ../llvm-3.5/tools/opt/PrintSCC.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opt.dir/PrintSCC.cpp.o -c /tmp/mcsema/llvm-3.5/tools/opt/PrintSCC.cpp

llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opt.dir/PrintSCC.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/opt/PrintSCC.cpp > CMakeFiles/opt.dir/PrintSCC.cpp.i

llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opt.dir/PrintSCC.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/opt/PrintSCC.cpp -o CMakeFiles/opt.dir/PrintSCC.cpp.s

llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o.requires:
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o.requires

llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o.provides: llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/opt/CMakeFiles/opt.dir/build.make llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o.provides.build
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o.provides

llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o.provides.build: llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o

llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o: llvm-3.5/tools/opt/CMakeFiles/opt.dir/flags.make
llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o: ../llvm-3.5/tools/opt/opt.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/mcsema/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opt.dir/opt.cpp.o -c /tmp/mcsema/llvm-3.5/tools/opt/opt.cpp

llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opt.dir/opt.cpp.i"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/mcsema/llvm-3.5/tools/opt/opt.cpp > CMakeFiles/opt.dir/opt.cpp.i

llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opt.dir/opt.cpp.s"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/mcsema/llvm-3.5/tools/opt/opt.cpp -o CMakeFiles/opt.dir/opt.cpp.s

llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o.requires:
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o.requires

llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o.provides: llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o.requires
	$(MAKE) -f llvm-3.5/tools/opt/CMakeFiles/opt.dir/build.make llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o.provides.build
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o.provides

llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o.provides.build: llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o

# Object files for target opt
opt_OBJECTS = \
"CMakeFiles/opt.dir/AnalysisWrappers.cpp.o" \
"CMakeFiles/opt.dir/BreakpointPrinter.cpp.o" \
"CMakeFiles/opt.dir/GraphPrinters.cpp.o" \
"CMakeFiles/opt.dir/NewPMDriver.cpp.o" \
"CMakeFiles/opt.dir/Passes.cpp.o" \
"CMakeFiles/opt.dir/PassPrinters.cpp.o" \
"CMakeFiles/opt.dir/PrintSCC.cpp.o" \
"CMakeFiles/opt.dir/opt.cpp.o"

# External object files for target opt
opt_EXTERNAL_OBJECTS =

llvm-3.5/bin/opt: llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o
llvm-3.5/bin/opt: llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o
llvm-3.5/bin/opt: llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o
llvm-3.5/bin/opt: llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o
llvm-3.5/bin/opt: llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o
llvm-3.5/bin/opt: llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o
llvm-3.5/bin/opt: llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o
llvm-3.5/bin/opt: llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o
llvm-3.5/bin/opt: llvm-3.5/tools/opt/CMakeFiles/opt.dir/build.make
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMX86CodeGen.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMX86AsmPrinter.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMX86AsmParser.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMX86Desc.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMX86Info.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMX86Disassembler.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMAnalysis.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMBitWriter.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMCodeGen.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMCore.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMipa.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMipo.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMIRReader.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMInstCombine.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMInstrumentation.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMMC.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMObjCARCOpts.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMScalarOpts.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMTarget.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMTransformUtils.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMVectorize.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMAsmPrinter.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMSelectionDAG.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMCodeGen.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMX86AsmPrinter.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMX86Utils.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMObject.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMMCParser.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMX86Info.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMScalarOpts.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMInstCombine.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMAsmParser.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMBitReader.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMTransformUtils.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMipa.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMAnalysis.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMTarget.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMCore.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMMC.a
llvm-3.5/bin/opt: llvm-3.5/lib/libLLVMSupport.a
llvm-3.5/bin/opt: llvm-3.5/tools/opt/CMakeFiles/opt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/opt"
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/opt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
llvm-3.5/tools/opt/CMakeFiles/opt.dir/build: llvm-3.5/bin/opt
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/build

llvm-3.5/tools/opt/CMakeFiles/opt.dir/requires: llvm-3.5/tools/opt/CMakeFiles/opt.dir/AnalysisWrappers.cpp.o.requires
llvm-3.5/tools/opt/CMakeFiles/opt.dir/requires: llvm-3.5/tools/opt/CMakeFiles/opt.dir/BreakpointPrinter.cpp.o.requires
llvm-3.5/tools/opt/CMakeFiles/opt.dir/requires: llvm-3.5/tools/opt/CMakeFiles/opt.dir/GraphPrinters.cpp.o.requires
llvm-3.5/tools/opt/CMakeFiles/opt.dir/requires: llvm-3.5/tools/opt/CMakeFiles/opt.dir/NewPMDriver.cpp.o.requires
llvm-3.5/tools/opt/CMakeFiles/opt.dir/requires: llvm-3.5/tools/opt/CMakeFiles/opt.dir/Passes.cpp.o.requires
llvm-3.5/tools/opt/CMakeFiles/opt.dir/requires: llvm-3.5/tools/opt/CMakeFiles/opt.dir/PassPrinters.cpp.o.requires
llvm-3.5/tools/opt/CMakeFiles/opt.dir/requires: llvm-3.5/tools/opt/CMakeFiles/opt.dir/PrintSCC.cpp.o.requires
llvm-3.5/tools/opt/CMakeFiles/opt.dir/requires: llvm-3.5/tools/opt/CMakeFiles/opt.dir/opt.cpp.o.requires
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/requires

llvm-3.5/tools/opt/CMakeFiles/opt.dir/clean:
	cd /tmp/mcsema/build/llvm-3.5/tools/opt && $(CMAKE_COMMAND) -P CMakeFiles/opt.dir/cmake_clean.cmake
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/clean

llvm-3.5/tools/opt/CMakeFiles/opt.dir/depend:
	cd /tmp/mcsema/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/mcsema /tmp/mcsema/llvm-3.5/tools/opt /tmp/mcsema/build /tmp/mcsema/build/llvm-3.5/tools/opt /tmp/mcsema/build/llvm-3.5/tools/opt/CMakeFiles/opt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : llvm-3.5/tools/opt/CMakeFiles/opt.dir/depend

