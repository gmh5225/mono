cmake_minimum_required(VERSION 3.24)
project(example VERSION 1.0.0)

# Add Qt6
find_package(Qt6 REQUIRED COMPONENTS Widgets Core)

# Add Mono
include(../mono.cmake)

# Qt overwrites CMAKE_CXX_STANDARD, so we need to force it
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(my_app)
add_subdirectory(my_lib)
