# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/amy/Downloads/kilombo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/amy/Downloads/kilombo/build

# Include any dependencies generated for this target.
include src/CMakeFiles/sim.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/sim.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/sim.dir/flags.make

src/CMakeFiles/sim.dir/display.c.o: src/CMakeFiles/sim.dir/flags.make
src/CMakeFiles/sim.dir/display.c.o: ../src/display.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/sim.dir/display.c.o"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sim.dir/display.c.o   -c /home/amy/Downloads/kilombo/src/display.c

src/CMakeFiles/sim.dir/display.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sim.dir/display.c.i"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/amy/Downloads/kilombo/src/display.c > CMakeFiles/sim.dir/display.c.i

src/CMakeFiles/sim.dir/display.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sim.dir/display.c.s"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/amy/Downloads/kilombo/src/display.c -o CMakeFiles/sim.dir/display.c.s

src/CMakeFiles/sim.dir/display.c.o.requires:

.PHONY : src/CMakeFiles/sim.dir/display.c.o.requires

src/CMakeFiles/sim.dir/display.c.o.provides: src/CMakeFiles/sim.dir/display.c.o.requires
	$(MAKE) -f src/CMakeFiles/sim.dir/build.make src/CMakeFiles/sim.dir/display.c.o.provides.build
.PHONY : src/CMakeFiles/sim.dir/display.c.o.provides

src/CMakeFiles/sim.dir/display.c.o.provides.build: src/CMakeFiles/sim.dir/display.c.o


src/CMakeFiles/sim.dir/skilobot.c.o: src/CMakeFiles/sim.dir/flags.make
src/CMakeFiles/sim.dir/skilobot.c.o: ../src/skilobot.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/CMakeFiles/sim.dir/skilobot.c.o"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sim.dir/skilobot.c.o   -c /home/amy/Downloads/kilombo/src/skilobot.c

src/CMakeFiles/sim.dir/skilobot.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sim.dir/skilobot.c.i"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/amy/Downloads/kilombo/src/skilobot.c > CMakeFiles/sim.dir/skilobot.c.i

src/CMakeFiles/sim.dir/skilobot.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sim.dir/skilobot.c.s"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/amy/Downloads/kilombo/src/skilobot.c -o CMakeFiles/sim.dir/skilobot.c.s

src/CMakeFiles/sim.dir/skilobot.c.o.requires:

.PHONY : src/CMakeFiles/sim.dir/skilobot.c.o.requires

src/CMakeFiles/sim.dir/skilobot.c.o.provides: src/CMakeFiles/sim.dir/skilobot.c.o.requires
	$(MAKE) -f src/CMakeFiles/sim.dir/build.make src/CMakeFiles/sim.dir/skilobot.c.o.provides.build
.PHONY : src/CMakeFiles/sim.dir/skilobot.c.o.provides

src/CMakeFiles/sim.dir/skilobot.c.o.provides.build: src/CMakeFiles/sim.dir/skilobot.c.o


src/CMakeFiles/sim.dir/kbapi.c.o: src/CMakeFiles/sim.dir/flags.make
src/CMakeFiles/sim.dir/kbapi.c.o: ../src/kbapi.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/CMakeFiles/sim.dir/kbapi.c.o"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sim.dir/kbapi.c.o   -c /home/amy/Downloads/kilombo/src/kbapi.c

src/CMakeFiles/sim.dir/kbapi.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sim.dir/kbapi.c.i"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/amy/Downloads/kilombo/src/kbapi.c > CMakeFiles/sim.dir/kbapi.c.i

src/CMakeFiles/sim.dir/kbapi.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sim.dir/kbapi.c.s"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/amy/Downloads/kilombo/src/kbapi.c -o CMakeFiles/sim.dir/kbapi.c.s

src/CMakeFiles/sim.dir/kbapi.c.o.requires:

.PHONY : src/CMakeFiles/sim.dir/kbapi.c.o.requires

src/CMakeFiles/sim.dir/kbapi.c.o.provides: src/CMakeFiles/sim.dir/kbapi.c.o.requires
	$(MAKE) -f src/CMakeFiles/sim.dir/build.make src/CMakeFiles/sim.dir/kbapi.c.o.provides.build
.PHONY : src/CMakeFiles/sim.dir/kbapi.c.o.provides

src/CMakeFiles/sim.dir/kbapi.c.o.provides.build: src/CMakeFiles/sim.dir/kbapi.c.o


src/CMakeFiles/sim.dir/params.c.o: src/CMakeFiles/sim.dir/flags.make
src/CMakeFiles/sim.dir/params.c.o: ../src/params.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/CMakeFiles/sim.dir/params.c.o"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sim.dir/params.c.o   -c /home/amy/Downloads/kilombo/src/params.c

src/CMakeFiles/sim.dir/params.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sim.dir/params.c.i"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/amy/Downloads/kilombo/src/params.c > CMakeFiles/sim.dir/params.c.i

src/CMakeFiles/sim.dir/params.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sim.dir/params.c.s"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/amy/Downloads/kilombo/src/params.c -o CMakeFiles/sim.dir/params.c.s

src/CMakeFiles/sim.dir/params.c.o.requires:

.PHONY : src/CMakeFiles/sim.dir/params.c.o.requires

src/CMakeFiles/sim.dir/params.c.o.provides: src/CMakeFiles/sim.dir/params.c.o.requires
	$(MAKE) -f src/CMakeFiles/sim.dir/build.make src/CMakeFiles/sim.dir/params.c.o.provides.build
.PHONY : src/CMakeFiles/sim.dir/params.c.o.provides

src/CMakeFiles/sim.dir/params.c.o.provides.build: src/CMakeFiles/sim.dir/params.c.o


src/CMakeFiles/sim.dir/stateio.c.o: src/CMakeFiles/sim.dir/flags.make
src/CMakeFiles/sim.dir/stateio.c.o: ../src/stateio.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object src/CMakeFiles/sim.dir/stateio.c.o"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sim.dir/stateio.c.o   -c /home/amy/Downloads/kilombo/src/stateio.c

src/CMakeFiles/sim.dir/stateio.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sim.dir/stateio.c.i"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/amy/Downloads/kilombo/src/stateio.c > CMakeFiles/sim.dir/stateio.c.i

src/CMakeFiles/sim.dir/stateio.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sim.dir/stateio.c.s"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/amy/Downloads/kilombo/src/stateio.c -o CMakeFiles/sim.dir/stateio.c.s

src/CMakeFiles/sim.dir/stateio.c.o.requires:

.PHONY : src/CMakeFiles/sim.dir/stateio.c.o.requires

src/CMakeFiles/sim.dir/stateio.c.o.provides: src/CMakeFiles/sim.dir/stateio.c.o.requires
	$(MAKE) -f src/CMakeFiles/sim.dir/build.make src/CMakeFiles/sim.dir/stateio.c.o.provides.build
.PHONY : src/CMakeFiles/sim.dir/stateio.c.o.provides

src/CMakeFiles/sim.dir/stateio.c.o.provides.build: src/CMakeFiles/sim.dir/stateio.c.o


src/CMakeFiles/sim.dir/runsim.c.o: src/CMakeFiles/sim.dir/flags.make
src/CMakeFiles/sim.dir/runsim.c.o: ../src/runsim.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object src/CMakeFiles/sim.dir/runsim.c.o"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sim.dir/runsim.c.o   -c /home/amy/Downloads/kilombo/src/runsim.c

src/CMakeFiles/sim.dir/runsim.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sim.dir/runsim.c.i"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/amy/Downloads/kilombo/src/runsim.c > CMakeFiles/sim.dir/runsim.c.i

src/CMakeFiles/sim.dir/runsim.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sim.dir/runsim.c.s"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/amy/Downloads/kilombo/src/runsim.c -o CMakeFiles/sim.dir/runsim.c.s

src/CMakeFiles/sim.dir/runsim.c.o.requires:

.PHONY : src/CMakeFiles/sim.dir/runsim.c.o.requires

src/CMakeFiles/sim.dir/runsim.c.o.provides: src/CMakeFiles/sim.dir/runsim.c.o.requires
	$(MAKE) -f src/CMakeFiles/sim.dir/build.make src/CMakeFiles/sim.dir/runsim.c.o.provides.build
.PHONY : src/CMakeFiles/sim.dir/runsim.c.o.provides

src/CMakeFiles/sim.dir/runsim.c.o.provides.build: src/CMakeFiles/sim.dir/runsim.c.o


src/CMakeFiles/sim.dir/neighbors.c.o: src/CMakeFiles/sim.dir/flags.make
src/CMakeFiles/sim.dir/neighbors.c.o: ../src/neighbors.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object src/CMakeFiles/sim.dir/neighbors.c.o"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sim.dir/neighbors.c.o   -c /home/amy/Downloads/kilombo/src/neighbors.c

src/CMakeFiles/sim.dir/neighbors.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sim.dir/neighbors.c.i"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/amy/Downloads/kilombo/src/neighbors.c > CMakeFiles/sim.dir/neighbors.c.i

src/CMakeFiles/sim.dir/neighbors.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sim.dir/neighbors.c.s"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/amy/Downloads/kilombo/src/neighbors.c -o CMakeFiles/sim.dir/neighbors.c.s

src/CMakeFiles/sim.dir/neighbors.c.o.requires:

.PHONY : src/CMakeFiles/sim.dir/neighbors.c.o.requires

src/CMakeFiles/sim.dir/neighbors.c.o.provides: src/CMakeFiles/sim.dir/neighbors.c.o.requires
	$(MAKE) -f src/CMakeFiles/sim.dir/build.make src/CMakeFiles/sim.dir/neighbors.c.o.provides.build
.PHONY : src/CMakeFiles/sim.dir/neighbors.c.o.provides

src/CMakeFiles/sim.dir/neighbors.c.o.provides.build: src/CMakeFiles/sim.dir/neighbors.c.o


src/CMakeFiles/sim.dir/distribution.c.o: src/CMakeFiles/sim.dir/flags.make
src/CMakeFiles/sim.dir/distribution.c.o: ../src/distribution.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object src/CMakeFiles/sim.dir/distribution.c.o"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sim.dir/distribution.c.o   -c /home/amy/Downloads/kilombo/src/distribution.c

src/CMakeFiles/sim.dir/distribution.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sim.dir/distribution.c.i"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/amy/Downloads/kilombo/src/distribution.c > CMakeFiles/sim.dir/distribution.c.i

src/CMakeFiles/sim.dir/distribution.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sim.dir/distribution.c.s"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/amy/Downloads/kilombo/src/distribution.c -o CMakeFiles/sim.dir/distribution.c.s

src/CMakeFiles/sim.dir/distribution.c.o.requires:

.PHONY : src/CMakeFiles/sim.dir/distribution.c.o.requires

src/CMakeFiles/sim.dir/distribution.c.o.provides: src/CMakeFiles/sim.dir/distribution.c.o.requires
	$(MAKE) -f src/CMakeFiles/sim.dir/build.make src/CMakeFiles/sim.dir/distribution.c.o.provides.build
.PHONY : src/CMakeFiles/sim.dir/distribution.c.o.provides

src/CMakeFiles/sim.dir/distribution.c.o.provides.build: src/CMakeFiles/sim.dir/distribution.c.o


src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o: src/CMakeFiles/sim.dir/flags.make
src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o: ../src/gfx/SDL_framerate.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sim.dir/gfx/SDL_framerate.c.o   -c /home/amy/Downloads/kilombo/src/gfx/SDL_framerate.c

src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sim.dir/gfx/SDL_framerate.c.i"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/amy/Downloads/kilombo/src/gfx/SDL_framerate.c > CMakeFiles/sim.dir/gfx/SDL_framerate.c.i

src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sim.dir/gfx/SDL_framerate.c.s"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/amy/Downloads/kilombo/src/gfx/SDL_framerate.c -o CMakeFiles/sim.dir/gfx/SDL_framerate.c.s

src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o.requires:

.PHONY : src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o.requires

src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o.provides: src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o.requires
	$(MAKE) -f src/CMakeFiles/sim.dir/build.make src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o.provides.build
.PHONY : src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o.provides

src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o.provides.build: src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o


src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o: src/CMakeFiles/sim.dir/flags.make
src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o: ../src/gfx/SDL_gfxPrimitives.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o   -c /home/amy/Downloads/kilombo/src/gfx/SDL_gfxPrimitives.c

src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.i"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/amy/Downloads/kilombo/src/gfx/SDL_gfxPrimitives.c > CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.i

src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.s"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/amy/Downloads/kilombo/src/gfx/SDL_gfxPrimitives.c -o CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.s

src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o.requires:

.PHONY : src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o.requires

src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o.provides: src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o.requires
	$(MAKE) -f src/CMakeFiles/sim.dir/build.make src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o.provides.build
.PHONY : src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o.provides

src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o.provides.build: src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o


src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o: src/CMakeFiles/sim.dir/flags.make
src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o: ../src/gfx/SDL_gfxBlitFunc.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o   -c /home/amy/Downloads/kilombo/src/gfx/SDL_gfxBlitFunc.c

src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.i"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/amy/Downloads/kilombo/src/gfx/SDL_gfxBlitFunc.c > CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.i

src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.s"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/amy/Downloads/kilombo/src/gfx/SDL_gfxBlitFunc.c -o CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.s

src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o.requires:

.PHONY : src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o.requires

src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o.provides: src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o.requires
	$(MAKE) -f src/CMakeFiles/sim.dir/build.make src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o.provides.build
.PHONY : src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o.provides

src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o.provides.build: src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o


src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o: src/CMakeFiles/sim.dir/flags.make
src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o: ../src/gfx/SDL_rotozoom.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o   -c /home/amy/Downloads/kilombo/src/gfx/SDL_rotozoom.c

src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.i"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/amy/Downloads/kilombo/src/gfx/SDL_rotozoom.c > CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.i

src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.s"
	cd /home/amy/Downloads/kilombo/build/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/amy/Downloads/kilombo/src/gfx/SDL_rotozoom.c -o CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.s

src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o.requires:

.PHONY : src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o.requires

src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o.provides: src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o.requires
	$(MAKE) -f src/CMakeFiles/sim.dir/build.make src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o.provides.build
.PHONY : src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o.provides

src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o.provides.build: src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o


# Object files for target sim
sim_OBJECTS = \
"CMakeFiles/sim.dir/display.c.o" \
"CMakeFiles/sim.dir/skilobot.c.o" \
"CMakeFiles/sim.dir/kbapi.c.o" \
"CMakeFiles/sim.dir/params.c.o" \
"CMakeFiles/sim.dir/stateio.c.o" \
"CMakeFiles/sim.dir/runsim.c.o" \
"CMakeFiles/sim.dir/neighbors.c.o" \
"CMakeFiles/sim.dir/distribution.c.o" \
"CMakeFiles/sim.dir/gfx/SDL_framerate.c.o" \
"CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o" \
"CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o" \
"CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o"

# External object files for target sim
sim_EXTERNAL_OBJECTS =

src/libsim.a: src/CMakeFiles/sim.dir/display.c.o
src/libsim.a: src/CMakeFiles/sim.dir/skilobot.c.o
src/libsim.a: src/CMakeFiles/sim.dir/kbapi.c.o
src/libsim.a: src/CMakeFiles/sim.dir/params.c.o
src/libsim.a: src/CMakeFiles/sim.dir/stateio.c.o
src/libsim.a: src/CMakeFiles/sim.dir/runsim.c.o
src/libsim.a: src/CMakeFiles/sim.dir/neighbors.c.o
src/libsim.a: src/CMakeFiles/sim.dir/distribution.c.o
src/libsim.a: src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o
src/libsim.a: src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o
src/libsim.a: src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o
src/libsim.a: src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o
src/libsim.a: src/CMakeFiles/sim.dir/build.make
src/libsim.a: src/CMakeFiles/sim.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/amy/Downloads/kilombo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Linking C static library libsim.a"
	cd /home/amy/Downloads/kilombo/build/src && $(CMAKE_COMMAND) -P CMakeFiles/sim.dir/cmake_clean_target.cmake
	cd /home/amy/Downloads/kilombo/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sim.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/sim.dir/build: src/libsim.a

.PHONY : src/CMakeFiles/sim.dir/build

src/CMakeFiles/sim.dir/requires: src/CMakeFiles/sim.dir/display.c.o.requires
src/CMakeFiles/sim.dir/requires: src/CMakeFiles/sim.dir/skilobot.c.o.requires
src/CMakeFiles/sim.dir/requires: src/CMakeFiles/sim.dir/kbapi.c.o.requires
src/CMakeFiles/sim.dir/requires: src/CMakeFiles/sim.dir/params.c.o.requires
src/CMakeFiles/sim.dir/requires: src/CMakeFiles/sim.dir/stateio.c.o.requires
src/CMakeFiles/sim.dir/requires: src/CMakeFiles/sim.dir/runsim.c.o.requires
src/CMakeFiles/sim.dir/requires: src/CMakeFiles/sim.dir/neighbors.c.o.requires
src/CMakeFiles/sim.dir/requires: src/CMakeFiles/sim.dir/distribution.c.o.requires
src/CMakeFiles/sim.dir/requires: src/CMakeFiles/sim.dir/gfx/SDL_framerate.c.o.requires
src/CMakeFiles/sim.dir/requires: src/CMakeFiles/sim.dir/gfx/SDL_gfxPrimitives.c.o.requires
src/CMakeFiles/sim.dir/requires: src/CMakeFiles/sim.dir/gfx/SDL_gfxBlitFunc.c.o.requires
src/CMakeFiles/sim.dir/requires: src/CMakeFiles/sim.dir/gfx/SDL_rotozoom.c.o.requires

.PHONY : src/CMakeFiles/sim.dir/requires

src/CMakeFiles/sim.dir/clean:
	cd /home/amy/Downloads/kilombo/build/src && $(CMAKE_COMMAND) -P CMakeFiles/sim.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/sim.dir/clean

src/CMakeFiles/sim.dir/depend:
	cd /home/amy/Downloads/kilombo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/amy/Downloads/kilombo /home/amy/Downloads/kilombo/src /home/amy/Downloads/kilombo/build /home/amy/Downloads/kilombo/build/src /home/amy/Downloads/kilombo/build/src/CMakeFiles/sim.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/sim.dir/depend

