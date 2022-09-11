include(${CMAKE_CURRENT_LIST_DIR}/mono-properties.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/hooks/mono-add-executable.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/hooks/mono-add-library.cmake)

if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set(CMAKE_BUILD_TYPE DEBUG)
endif()

if(CMAKE_BUILD_TYPE STREQUAL Release)
  set(CMAKE_BUILD_TYPE RELEASE)
endif()

if(CMAKE_BUILD_TYPE STREQUAL RelWithDebInfo)
  set(CMAKE_BUILD_TYPE RELWITHDEBINFO)
endif()

if(CMAKE_BUILD_TYPE STREQUAL MinSizeRel)
  set(CMAKE_BUILD_TYPE MINSIZEREL)
endif()

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "RELEASE" CACHE STRING "Choose ${PROJECT_NAME} build type, options are: Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif()

if(NOT CMAKE_BUILD_TYPE MATCHES "^(DEBUG|RELEASE|RELWITHDEBINFO|MINSIZEREL)$")
  message(FATAL_ERROR "Invalid build type: ${CMAKE_BUILD_TYPE}")
endif()

# Strip CMake default flags. They cause more problems than they solve.

string(REPLACE "" "" CMAKE_C_FLAGS_DEBUG "")
string(REPLACE "" "" CMAKE_CXX_FLAGS_DEBUG "")
string(REPLACE "" "" CMAKE_LINKER_FLAGS_DEBUG "")
string(REPLACE "" "" CMAKE_C_FLAGS_RELEASE "")
string(REPLACE "" "" CMAKE_CXX_FLAGS_RELEASE "")
string(REPLACE "" "" CMAKE_LINKER_FLAGS_RELEASE "")
string(REPLACE "" "" CMAKE_C_FLAGS_RELWITHDEBINFO "")
string(REPLACE "" "" CMAKE_CXX_FLAGS_RELWITHDEBINFO "")
string(REPLACE "" "" CMAKE_LINKER_FLAGS_RELWITHDEBINFO "")
string(REPLACE "" "" CMAKE_C_FLAGS_MINSIZEREL "")
string(REPLACE "" "" CMAKE_CXX_FLAGS_MINSIZEREL "")
string(REPLACE "" "" CMAKE_LINKER_FLAGS_MINSIZEREL "")
