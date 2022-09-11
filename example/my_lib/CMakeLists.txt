add_library(my_lib
# We don't want INTERFACE_INCLUDE_DIRECTORIES to be prefixed in the
# source directory. See: https://stackoverflow.com/questions/25676277/cmake-target-include-directories-prints-an-error-when-i-try-to-add-the-source
[[pub(include_directories)]]
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/my_lib>
  $<INSTALL_INTERFACE:include/my_lib>
)
