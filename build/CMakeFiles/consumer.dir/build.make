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
include CMakeFiles/consumer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/consumer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/consumer.dir/flags.make

CMakeFiles/consumer.dir/scsi.c.o: CMakeFiles/consumer.dir/flags.make
CMakeFiles/consumer.dir/scsi.c.o: ../scsi.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/consumer.dir/scsi.c.o"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/consumer.dir/scsi.c.o   -c /root/tcmu-runner/scsi.c

CMakeFiles/consumer.dir/scsi.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/consumer.dir/scsi.c.i"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/tcmu-runner/scsi.c > CMakeFiles/consumer.dir/scsi.c.i

CMakeFiles/consumer.dir/scsi.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/consumer.dir/scsi.c.s"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/tcmu-runner/scsi.c -o CMakeFiles/consumer.dir/scsi.c.s

CMakeFiles/consumer.dir/consumer.c.o: CMakeFiles/consumer.dir/flags.make
CMakeFiles/consumer.dir/consumer.c.o: ../consumer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/consumer.dir/consumer.c.o"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/consumer.dir/consumer.c.o   -c /root/tcmu-runner/consumer.c

CMakeFiles/consumer.dir/consumer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/consumer.dir/consumer.c.i"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/tcmu-runner/consumer.c > CMakeFiles/consumer.dir/consumer.c.i

CMakeFiles/consumer.dir/consumer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/consumer.dir/consumer.c.s"
	/opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/tcmu-runner/consumer.c -o CMakeFiles/consumer.dir/consumer.c.s

# Object files for target consumer
consumer_OBJECTS = \
"CMakeFiles/consumer.dir/scsi.c.o" \
"CMakeFiles/consumer.dir/consumer.c.o"

# External object files for target consumer
consumer_EXTERNAL_OBJECTS =

consumer: CMakeFiles/consumer.dir/scsi.c.o
consumer: CMakeFiles/consumer.dir/consumer.c.o
consumer: CMakeFiles/consumer.dir/build.make
consumer: libtcmu.so.2.2
consumer: /usr/lib64/libnl-3.so
consumer: /usr/lib64/libnl-genl-3.so
consumer: /usr/lib64/libpthread.so
consumer: /usr/lib64/libtcmalloc.so
consumer: CMakeFiles/consumer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/tcmu-runner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable consumer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/consumer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/consumer.dir/build: consumer

.PHONY : CMakeFiles/consumer.dir/build

CMakeFiles/consumer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/consumer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/consumer.dir/clean

CMakeFiles/consumer.dir/depend:
	cd /root/tcmu-runner/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/tcmu-runner /root/tcmu-runner /root/tcmu-runner/build /root/tcmu-runner/build /root/tcmu-runner/build/CMakeFiles/consumer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/consumer.dir/depend

