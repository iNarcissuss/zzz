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

# Include any dependencies generated for this target.
include tools/stp/CMakeFiles/stp.dir/depend.make

# Include the progress variables for this target.
include tools/stp/CMakeFiles/stp.dir/progress.make

# Include the compile flags for this target's objects.
include tools/stp/CMakeFiles/stp.dir/flags.make

tools/stp/CMakeFiles/stp.dir/main.cpp.o: tools/stp/CMakeFiles/stp.dir/flags.make
tools/stp/CMakeFiles/stp.dir/main.cpp.o: ../tools/stp/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tools/stp/CMakeFiles/stp.dir/main.cpp.o"
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/stp.dir/main.cpp.o -c /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/tools/stp/main.cpp

tools/stp/CMakeFiles/stp.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stp.dir/main.cpp.i"
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/tools/stp/main.cpp > CMakeFiles/stp.dir/main.cpp.i

tools/stp/CMakeFiles/stp.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stp.dir/main.cpp.s"
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/tools/stp/main.cpp -o CMakeFiles/stp.dir/main.cpp.s

tools/stp/CMakeFiles/stp.dir/main.cpp.o.requires:
.PHONY : tools/stp/CMakeFiles/stp.dir/main.cpp.o.requires

tools/stp/CMakeFiles/stp.dir/main.cpp.o.provides: tools/stp/CMakeFiles/stp.dir/main.cpp.o.requires
	$(MAKE) -f tools/stp/CMakeFiles/stp.dir/build.make tools/stp/CMakeFiles/stp.dir/main.cpp.o.provides.build
.PHONY : tools/stp/CMakeFiles/stp.dir/main.cpp.o.provides

tools/stp/CMakeFiles/stp.dir/main.cpp.o.provides.build: tools/stp/CMakeFiles/stp.dir/main.cpp.o

tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o: tools/stp/CMakeFiles/stp.dir/flags.make
tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o: ../tools/stp/STPProgramGlobals.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o"
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/stp.dir/STPProgramGlobals.cpp.o -c /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/tools/stp/STPProgramGlobals.cpp

tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stp.dir/STPProgramGlobals.cpp.i"
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/tools/stp/STPProgramGlobals.cpp > CMakeFiles/stp.dir/STPProgramGlobals.cpp.i

tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stp.dir/STPProgramGlobals.cpp.s"
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/tools/stp/STPProgramGlobals.cpp -o CMakeFiles/stp.dir/STPProgramGlobals.cpp.s

tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o.requires:
.PHONY : tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o.requires

tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o.provides: tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o.requires
	$(MAKE) -f tools/stp/CMakeFiles/stp.dir/build.make tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o.provides.build
.PHONY : tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o.provides

tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o.provides.build: tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o

tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o: tools/stp/CMakeFiles/stp.dir/flags.make
tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o: tools/stp/GitSHA1.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o"
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/stp.dir/GitSHA1.cpp.o -c /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp/GitSHA1.cpp

tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stp.dir/GitSHA1.cpp.i"
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp/GitSHA1.cpp > CMakeFiles/stp.dir/GitSHA1.cpp.i

tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stp.dir/GitSHA1.cpp.s"
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp/GitSHA1.cpp -o CMakeFiles/stp.dir/GitSHA1.cpp.s

tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o.requires:
.PHONY : tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o.requires

tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o.provides: tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o.requires
	$(MAKE) -f tools/stp/CMakeFiles/stp.dir/build.make tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o.provides.build
.PHONY : tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o.provides

tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o.provides.build: tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o

# Object files for target stp
stp_OBJECTS = \
"CMakeFiles/stp.dir/main.cpp.o" \
"CMakeFiles/stp.dir/STPProgramGlobals.cpp.o" \
"CMakeFiles/stp.dir/GitSHA1.cpp.o"

# External object files for target stp
stp_EXTERNAL_OBJECTS =

stp: tools/stp/CMakeFiles/stp.dir/main.cpp.o
stp: tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o
stp: tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o
stp: tools/stp/CMakeFiles/stp.dir/build.make
stp: lib/libstp.so
stp: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
stp: /usr/lib/x86_64-linux-gnu/libboost_system.so
stp: tools/stp/CMakeFiles/stp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../stp"
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/stp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/stp/CMakeFiles/stp.dir/build: stp
.PHONY : tools/stp/CMakeFiles/stp.dir/build

tools/stp/CMakeFiles/stp.dir/requires: tools/stp/CMakeFiles/stp.dir/main.cpp.o.requires
tools/stp/CMakeFiles/stp.dir/requires: tools/stp/CMakeFiles/stp.dir/STPProgramGlobals.cpp.o.requires
tools/stp/CMakeFiles/stp.dir/requires: tools/stp/CMakeFiles/stp.dir/GitSHA1.cpp.o.requires
.PHONY : tools/stp/CMakeFiles/stp.dir/requires

tools/stp/CMakeFiles/stp.dir/clean:
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp && $(CMAKE_COMMAND) -P CMakeFiles/stp.dir/cmake_clean.cmake
.PHONY : tools/stp/CMakeFiles/stp.dir/clean

tools/stp/CMakeFiles/stp.dir/depend:
	cd /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/src/github.com/vdun/stoke/stoke/stp /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/tools/stp /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp /home/ubuntu/src/github.com/vdun/stoke/stoke/stp/build/tools/stp/CMakeFiles/stp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/stp/CMakeFiles/stp.dir/depend

