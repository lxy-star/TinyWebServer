# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lxy/VSCodeWorkSpace/TinyWebService

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lxy/VSCodeWorkSpace/TinyWebService/build

# Include any dependencies generated for this target.
include CMakeFiles/TinyWebService.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/TinyWebService.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/TinyWebService.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TinyWebService.dir/flags.make

CMakeFiles/TinyWebService.dir/code/main.cpp.o: CMakeFiles/TinyWebService.dir/flags.make
CMakeFiles/TinyWebService.dir/code/main.cpp.o: ../code/main.cpp
CMakeFiles/TinyWebService.dir/code/main.cpp.o: CMakeFiles/TinyWebService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/TinyWebService.dir/code/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TinyWebService.dir/code/main.cpp.o -MF CMakeFiles/TinyWebService.dir/code/main.cpp.o.d -o CMakeFiles/TinyWebService.dir/code/main.cpp.o -c /home/lxy/VSCodeWorkSpace/TinyWebService/code/main.cpp

CMakeFiles/TinyWebService.dir/code/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TinyWebService.dir/code/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lxy/VSCodeWorkSpace/TinyWebService/code/main.cpp > CMakeFiles/TinyWebService.dir/code/main.cpp.i

CMakeFiles/TinyWebService.dir/code/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TinyWebService.dir/code/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lxy/VSCodeWorkSpace/TinyWebService/code/main.cpp -o CMakeFiles/TinyWebService.dir/code/main.cpp.s

CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.o: CMakeFiles/TinyWebService.dir/flags.make
CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.o: ../code/buffer/src/buffer.cpp
CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.o: CMakeFiles/TinyWebService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.o -MF CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.o.d -o CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.o -c /home/lxy/VSCodeWorkSpace/TinyWebService/code/buffer/src/buffer.cpp

CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lxy/VSCodeWorkSpace/TinyWebService/code/buffer/src/buffer.cpp > CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.i

CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lxy/VSCodeWorkSpace/TinyWebService/code/buffer/src/buffer.cpp -o CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.s

CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.o: CMakeFiles/TinyWebService.dir/flags.make
CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.o: ../code/http/src/httpconn.cpp
CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.o: CMakeFiles/TinyWebService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.o -MF CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.o.d -o CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.o -c /home/lxy/VSCodeWorkSpace/TinyWebService/code/http/src/httpconn.cpp

CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lxy/VSCodeWorkSpace/TinyWebService/code/http/src/httpconn.cpp > CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.i

CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lxy/VSCodeWorkSpace/TinyWebService/code/http/src/httpconn.cpp -o CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.s

CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.o: CMakeFiles/TinyWebService.dir/flags.make
CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.o: ../code/http/src/httprequest.cpp
CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.o: CMakeFiles/TinyWebService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.o -MF CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.o.d -o CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.o -c /home/lxy/VSCodeWorkSpace/TinyWebService/code/http/src/httprequest.cpp

CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lxy/VSCodeWorkSpace/TinyWebService/code/http/src/httprequest.cpp > CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.i

CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lxy/VSCodeWorkSpace/TinyWebService/code/http/src/httprequest.cpp -o CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.s

CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.o: CMakeFiles/TinyWebService.dir/flags.make
CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.o: ../code/http/src/httpresponse.cpp
CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.o: CMakeFiles/TinyWebService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.o -MF CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.o.d -o CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.o -c /home/lxy/VSCodeWorkSpace/TinyWebService/code/http/src/httpresponse.cpp

CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lxy/VSCodeWorkSpace/TinyWebService/code/http/src/httpresponse.cpp > CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.i

CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lxy/VSCodeWorkSpace/TinyWebService/code/http/src/httpresponse.cpp -o CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.s

CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.o: CMakeFiles/TinyWebService.dir/flags.make
CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.o: ../code/log/src/log.cpp
CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.o: CMakeFiles/TinyWebService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.o -MF CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.o.d -o CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.o -c /home/lxy/VSCodeWorkSpace/TinyWebService/code/log/src/log.cpp

CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lxy/VSCodeWorkSpace/TinyWebService/code/log/src/log.cpp > CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.i

CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lxy/VSCodeWorkSpace/TinyWebService/code/log/src/log.cpp -o CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.s

CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.o: CMakeFiles/TinyWebService.dir/flags.make
CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.o: ../code/pool/src/sqlconnRAII.cpp
CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.o: CMakeFiles/TinyWebService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.o -MF CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.o.d -o CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.o -c /home/lxy/VSCodeWorkSpace/TinyWebService/code/pool/src/sqlconnRAII.cpp

CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lxy/VSCodeWorkSpace/TinyWebService/code/pool/src/sqlconnRAII.cpp > CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.i

CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lxy/VSCodeWorkSpace/TinyWebService/code/pool/src/sqlconnRAII.cpp -o CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.s

CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.o: CMakeFiles/TinyWebService.dir/flags.make
CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.o: ../code/pool/src/sqlconnpool.cpp
CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.o: CMakeFiles/TinyWebService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.o -MF CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.o.d -o CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.o -c /home/lxy/VSCodeWorkSpace/TinyWebService/code/pool/src/sqlconnpool.cpp

CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lxy/VSCodeWorkSpace/TinyWebService/code/pool/src/sqlconnpool.cpp > CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.i

CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lxy/VSCodeWorkSpace/TinyWebService/code/pool/src/sqlconnpool.cpp -o CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.s

CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.o: CMakeFiles/TinyWebService.dir/flags.make
CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.o: ../code/server/src/epoller.cpp
CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.o: CMakeFiles/TinyWebService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.o -MF CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.o.d -o CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.o -c /home/lxy/VSCodeWorkSpace/TinyWebService/code/server/src/epoller.cpp

CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lxy/VSCodeWorkSpace/TinyWebService/code/server/src/epoller.cpp > CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.i

CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lxy/VSCodeWorkSpace/TinyWebService/code/server/src/epoller.cpp -o CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.s

CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.o: CMakeFiles/TinyWebService.dir/flags.make
CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.o: ../code/server/src/webserver.cpp
CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.o: CMakeFiles/TinyWebService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.o -MF CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.o.d -o CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.o -c /home/lxy/VSCodeWorkSpace/TinyWebService/code/server/src/webserver.cpp

CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lxy/VSCodeWorkSpace/TinyWebService/code/server/src/webserver.cpp > CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.i

CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lxy/VSCodeWorkSpace/TinyWebService/code/server/src/webserver.cpp -o CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.s

CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.o: CMakeFiles/TinyWebService.dir/flags.make
CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.o: ../code/timer/src/heaptimer.cpp
CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.o: CMakeFiles/TinyWebService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.o -MF CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.o.d -o CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.o -c /home/lxy/VSCodeWorkSpace/TinyWebService/code/timer/src/heaptimer.cpp

CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lxy/VSCodeWorkSpace/TinyWebService/code/timer/src/heaptimer.cpp > CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.i

CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lxy/VSCodeWorkSpace/TinyWebService/code/timer/src/heaptimer.cpp -o CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.s

# Object files for target TinyWebService
TinyWebService_OBJECTS = \
"CMakeFiles/TinyWebService.dir/code/main.cpp.o" \
"CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.o" \
"CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.o" \
"CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.o" \
"CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.o" \
"CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.o" \
"CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.o" \
"CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.o" \
"CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.o" \
"CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.o" \
"CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.o"

# External object files for target TinyWebService
TinyWebService_EXTERNAL_OBJECTS =

TinyWebService: CMakeFiles/TinyWebService.dir/code/main.cpp.o
TinyWebService: CMakeFiles/TinyWebService.dir/code/buffer/src/buffer.cpp.o
TinyWebService: CMakeFiles/TinyWebService.dir/code/http/src/httpconn.cpp.o
TinyWebService: CMakeFiles/TinyWebService.dir/code/http/src/httprequest.cpp.o
TinyWebService: CMakeFiles/TinyWebService.dir/code/http/src/httpresponse.cpp.o
TinyWebService: CMakeFiles/TinyWebService.dir/code/log/src/log.cpp.o
TinyWebService: CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnRAII.cpp.o
TinyWebService: CMakeFiles/TinyWebService.dir/code/pool/src/sqlconnpool.cpp.o
TinyWebService: CMakeFiles/TinyWebService.dir/code/server/src/epoller.cpp.o
TinyWebService: CMakeFiles/TinyWebService.dir/code/server/src/webserver.cpp.o
TinyWebService: CMakeFiles/TinyWebService.dir/code/timer/src/heaptimer.cpp.o
TinyWebService: CMakeFiles/TinyWebService.dir/build.make
TinyWebService: CMakeFiles/TinyWebService.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Linking CXX executable TinyWebService"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TinyWebService.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TinyWebService.dir/build: TinyWebService
.PHONY : CMakeFiles/TinyWebService.dir/build

CMakeFiles/TinyWebService.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TinyWebService.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TinyWebService.dir/clean

CMakeFiles/TinyWebService.dir/depend:
	cd /home/lxy/VSCodeWorkSpace/TinyWebService/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lxy/VSCodeWorkSpace/TinyWebService /home/lxy/VSCodeWorkSpace/TinyWebService /home/lxy/VSCodeWorkSpace/TinyWebService/build /home/lxy/VSCodeWorkSpace/TinyWebService/build /home/lxy/VSCodeWorkSpace/TinyWebService/build/CMakeFiles/TinyWebService.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TinyWebService.dir/depend

