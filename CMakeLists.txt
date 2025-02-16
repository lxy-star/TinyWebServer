# <title="Main CMakeLists.txt">
cmake_minimum_required(VERSION 3.10)
project(TinyWebService)

# 设置C++标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 包含头文件路径
include_directories(
    code/buffer/include
    code/http/include
    code/log/include
    code/pool/include
    code/server/include
    code/timer/include
)

# 使用 pkg-config 查找 MySQL
find_package(PkgConfig REQUIRED)
pkg_check_modules(MYSQL REQUIRED mysqlclient)

if(MYSQL_FOUND)
    message(STATUS "MySQL found: ${MYSQL_LIBRARIES}")
else()
    message(FATAL_ERROR "MySQL not found")
endif()

# 收集所有源文件
file(GLOB BUFFER_SOURCES "code/buffer/src/*.cpp")
file(GLOB HTTP_SOURCES "code/http/src/*.cpp")
file(GLOB LOG_SOURCES "code/log/src/*.cpp")
file(GLOB POOL_SOURCES "code/pool/src/*.cpp")
file(GLOB SERVER_SOURCES "code/server/src/*.cpp")
file(GLOB TIMER_SOURCES "code/timer/src/*.cpp")

# 将所有源文件添加到可执行文件
add_executable(TinyWebService 
    code/main.cpp
    ${BUFFER_SOURCES}
    ${HTTP_SOURCES}
    ${LOG_SOURCES}
    ${POOL_SOURCES}
    ${SERVER_SOURCES}
    ${TIMER_SOURCES}
)

# 链接 MySQL 库
target_link_libraries(TinyWebService ${MYSQL_LIBRARIES})

# 包含 MySQL 头文件路径
target_include_directories(TinyWebService PRIVATE ${MYSQL_INCLUDE_DIRS})