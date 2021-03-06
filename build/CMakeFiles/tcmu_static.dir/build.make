# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/tcmu-runner

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/tcmu-runner/build

# Include any dependencies generated for this target.
include CMakeFiles/tcmu_static.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/tcmu_static.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/tcmu_static.dir/flags.make

../tcmuhandler-generated.c: ../tcmu-handler.xml
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../tcmuhandler-generated.c, ../tcmuhandler-generated.h"
	gdbus-codegen /root/tcmu-runner/tcmu-handler.xml --generate-c-code /root/tcmu-runner/tcmuhandler-generated --c-generate-object-manager --interface-prefix org.kernel

../tcmuhandler-generated.h: ../tcmuhandler-generated.c
	@$(CMAKE_COMMAND) -E touch_nocreate ../tcmuhandler-generated.h

CMakeFiles/tcmu_static.dir/strlcpy.c.o: CMakeFiles/tcmu_static.dir/flags.make
CMakeFiles/tcmu_static.dir/strlcpy.c.o: ../strlcpy.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/tcmu_static.dir/strlcpy.c.o"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tcmu_static.dir/strlcpy.c.o   -c /root/tcmu-runner/strlcpy.c

CMakeFiles/tcmu_static.dir/strlcpy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tcmu_static.dir/strlcpy.c.i"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/tcmu-runner/strlcpy.c > CMakeFiles/tcmu_static.dir/strlcpy.c.i

CMakeFiles/tcmu_static.dir/strlcpy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tcmu_static.dir/strlcpy.c.s"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/tcmu-runner/strlcpy.c -o CMakeFiles/tcmu_static.dir/strlcpy.c.s

CMakeFiles/tcmu_static.dir/configfs.c.o: CMakeFiles/tcmu_static.dir/flags.make
CMakeFiles/tcmu_static.dir/configfs.c.o: ../configfs.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/tcmu_static.dir/configfs.c.o"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tcmu_static.dir/configfs.c.o   -c /root/tcmu-runner/configfs.c

CMakeFiles/tcmu_static.dir/configfs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tcmu_static.dir/configfs.c.i"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/tcmu-runner/configfs.c > CMakeFiles/tcmu_static.dir/configfs.c.i

CMakeFiles/tcmu_static.dir/configfs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tcmu_static.dir/configfs.c.s"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/tcmu-runner/configfs.c -o CMakeFiles/tcmu_static.dir/configfs.c.s

CMakeFiles/tcmu_static.dir/api.c.o: CMakeFiles/tcmu_static.dir/flags.make
CMakeFiles/tcmu_static.dir/api.c.o: ../api.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/tcmu_static.dir/api.c.o"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tcmu_static.dir/api.c.o   -c /root/tcmu-runner/api.c

CMakeFiles/tcmu_static.dir/api.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tcmu_static.dir/api.c.i"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/tcmu-runner/api.c > CMakeFiles/tcmu_static.dir/api.c.i

CMakeFiles/tcmu_static.dir/api.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tcmu_static.dir/api.c.s"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/tcmu-runner/api.c -o CMakeFiles/tcmu_static.dir/api.c.s

CMakeFiles/tcmu_static.dir/libtcmu.c.o: CMakeFiles/tcmu_static.dir/flags.make
CMakeFiles/tcmu_static.dir/libtcmu.c.o: ../libtcmu.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/tcmu_static.dir/libtcmu.c.o"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tcmu_static.dir/libtcmu.c.o   -c /root/tcmu-runner/libtcmu.c

CMakeFiles/tcmu_static.dir/libtcmu.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tcmu_static.dir/libtcmu.c.i"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/tcmu-runner/libtcmu.c > CMakeFiles/tcmu_static.dir/libtcmu.c.i

CMakeFiles/tcmu_static.dir/libtcmu.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tcmu_static.dir/libtcmu.c.s"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/tcmu-runner/libtcmu.c -o CMakeFiles/tcmu_static.dir/libtcmu.c.s

CMakeFiles/tcmu_static.dir/libtcmu-register.c.o: CMakeFiles/tcmu_static.dir/flags.make
CMakeFiles/tcmu_static.dir/libtcmu-register.c.o: ../libtcmu-register.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/tcmu_static.dir/libtcmu-register.c.o"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tcmu_static.dir/libtcmu-register.c.o   -c /root/tcmu-runner/libtcmu-register.c

CMakeFiles/tcmu_static.dir/libtcmu-register.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tcmu_static.dir/libtcmu-register.c.i"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/tcmu-runner/libtcmu-register.c > CMakeFiles/tcmu_static.dir/libtcmu-register.c.i

CMakeFiles/tcmu_static.dir/libtcmu-register.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tcmu_static.dir/libtcmu-register.c.s"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/tcmu-runner/libtcmu-register.c -o CMakeFiles/tcmu_static.dir/libtcmu-register.c.s

CMakeFiles/tcmu_static.dir/tcmuhandler-generated.c.o: CMakeFiles/tcmu_static.dir/flags.make
CMakeFiles/tcmu_static.dir/tcmuhandler-generated.c.o: ../tcmuhandler-generated.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/tcmu_static.dir/tcmuhandler-generated.c.o"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tcmu_static.dir/tcmuhandler-generated.c.o   -c /root/tcmu-runner/tcmuhandler-generated.c

CMakeFiles/tcmu_static.dir/tcmuhandler-generated.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tcmu_static.dir/tcmuhandler-generated.c.i"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/tcmu-runner/tcmuhandler-generated.c > CMakeFiles/tcmu_static.dir/tcmuhandler-generated.c.i

CMakeFiles/tcmu_static.dir/tcmuhandler-generated.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tcmu_static.dir/tcmuhandler-generated.c.s"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/tcmu-runner/tcmuhandler-generated.c -o CMakeFiles/tcmu_static.dir/tcmuhandler-generated.c.s

CMakeFiles/tcmu_static.dir/libtcmu_log.c.o: CMakeFiles/tcmu_static.dir/flags.make
CMakeFiles/tcmu_static.dir/libtcmu_log.c.o: ../libtcmu_log.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/tcmu_static.dir/libtcmu_log.c.o"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tcmu_static.dir/libtcmu_log.c.o   -c /root/tcmu-runner/libtcmu_log.c

CMakeFiles/tcmu_static.dir/libtcmu_log.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tcmu_static.dir/libtcmu_log.c.i"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/tcmu-runner/libtcmu_log.c > CMakeFiles/tcmu_static.dir/libtcmu_log.c.i

CMakeFiles/tcmu_static.dir/libtcmu_log.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tcmu_static.dir/libtcmu_log.c.s"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/tcmu-runner/libtcmu_log.c -o CMakeFiles/tcmu_static.dir/libtcmu_log.c.s

CMakeFiles/tcmu_static.dir/libtcmu_config.c.o: CMakeFiles/tcmu_static.dir/flags.make
CMakeFiles/tcmu_static.dir/libtcmu_config.c.o: ../libtcmu_config.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/tcmu_static.dir/libtcmu_config.c.o"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tcmu_static.dir/libtcmu_config.c.o   -c /root/tcmu-runner/libtcmu_config.c

CMakeFiles/tcmu_static.dir/libtcmu_config.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tcmu_static.dir/libtcmu_config.c.i"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/tcmu-runner/libtcmu_config.c > CMakeFiles/tcmu_static.dir/libtcmu_config.c.i

CMakeFiles/tcmu_static.dir/libtcmu_config.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tcmu_static.dir/libtcmu_config.c.s"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/tcmu-runner/libtcmu_config.c -o CMakeFiles/tcmu_static.dir/libtcmu_config.c.s

CMakeFiles/tcmu_static.dir/libtcmu_time.c.o: CMakeFiles/tcmu_static.dir/flags.make
CMakeFiles/tcmu_static.dir/libtcmu_time.c.o: ../libtcmu_time.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/tcmu_static.dir/libtcmu_time.c.o"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tcmu_static.dir/libtcmu_time.c.o   -c /root/tcmu-runner/libtcmu_time.c

CMakeFiles/tcmu_static.dir/libtcmu_time.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tcmu_static.dir/libtcmu_time.c.i"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/tcmu-runner/libtcmu_time.c > CMakeFiles/tcmu_static.dir/libtcmu_time.c.i

CMakeFiles/tcmu_static.dir/libtcmu_time.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tcmu_static.dir/libtcmu_time.c.s"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/tcmu-runner/libtcmu_time.c -o CMakeFiles/tcmu_static.dir/libtcmu_time.c.s

# Object files for target tcmu_static
tcmu_static_OBJECTS = \
"CMakeFiles/tcmu_static.dir/strlcpy.c.o" \
"CMakeFiles/tcmu_static.dir/configfs.c.o" \
"CMakeFiles/tcmu_static.dir/api.c.o" \
"CMakeFiles/tcmu_static.dir/libtcmu.c.o" \
"CMakeFiles/tcmu_static.dir/libtcmu-register.c.o" \
"CMakeFiles/tcmu_static.dir/tcmuhandler-generated.c.o" \
"CMakeFiles/tcmu_static.dir/libtcmu_log.c.o" \
"CMakeFiles/tcmu_static.dir/libtcmu_config.c.o" \
"CMakeFiles/tcmu_static.dir/libtcmu_time.c.o"

# External object files for target tcmu_static
tcmu_static_EXTERNAL_OBJECTS =

libtcmu_static.a: CMakeFiles/tcmu_static.dir/strlcpy.c.o
libtcmu_static.a: CMakeFiles/tcmu_static.dir/configfs.c.o
libtcmu_static.a: CMakeFiles/tcmu_static.dir/api.c.o
libtcmu_static.a: CMakeFiles/tcmu_static.dir/libtcmu.c.o
libtcmu_static.a: CMakeFiles/tcmu_static.dir/libtcmu-register.c.o
libtcmu_static.a: CMakeFiles/tcmu_static.dir/tcmuhandler-generated.c.o
libtcmu_static.a: CMakeFiles/tcmu_static.dir/libtcmu_log.c.o
libtcmu_static.a: CMakeFiles/tcmu_static.dir/libtcmu_config.c.o
libtcmu_static.a: CMakeFiles/tcmu_static.dir/libtcmu_time.c.o
libtcmu_static.a: CMakeFiles/tcmu_static.dir/build.make
libtcmu_static.a: CMakeFiles/tcmu_static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking C static library libtcmu_static.a"
	$(CMAKE_COMMAND) -P CMakeFiles/tcmu_static.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tcmu_static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/tcmu_static.dir/build: libtcmu_static.a

.PHONY : CMakeFiles/tcmu_static.dir/build

CMakeFiles/tcmu_static.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tcmu_static.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tcmu_static.dir/clean

CMakeFiles/tcmu_static.dir/depend: ../tcmuhandler-generated.c
CMakeFiles/tcmu_static.dir/depend: ../tcmuhandler-generated.h
	cd /root/tcmu-runner/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/tcmu-runner /root/tcmu-runner /root/tcmu-runner/build /root/tcmu-runner/build /root/tcmu-runner/build/CMakeFiles/tcmu_static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tcmu_static.dir/depend

