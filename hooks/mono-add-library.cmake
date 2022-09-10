function(add_library name)
  cmake_parse_arguments(parsed
    ""
    ""
    "[dependencies]"
    ${ARGN}
  )

  if(parsed_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "Bad arguments: ${parsed_UNPARSED_ARGUMENTS}")
  endif()

  if(parsed_KEYWORDS_MISSING_VALUES)
    message(FATAL_ERROR "Missing values for keywords: ${parsed_KEYWORDS_MISSING_VALUES}")
  endif()

  if(NOT ${name} STREQUAL ${PROJECT_NAME})
    string(TOUPPER "${PROJECT_NAME}_BUILD_${name}" BUILD)
    option(${BUILD} "Build ${name}" ON) # This is cached, so it won't be re-evaluated.
    if(NOT ${BUILD})
      return()
    endif()
  endif()

  file(GLOB_RECURSE modules CONFIGURE_DEPENDS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.ixx *.cpp *.hpp *.h *.c)
  _add_library(${name} ${modules} ${parsed_UNPARSED_ARGUMENTS})

  target_compile_options(${name}
    PRIVATE
      $<$<CXX_COMPILER_ID:MSVC>:/W4 /WX /std:c++latest>
      $<$<CXX_COMPILER_ID:GNU>:-Wall -Wextra -Werror -pedantic -std=c++23>
      $<$<CXX_COMPILER_ID:Clang>:-Wall -Wextra -Werror -pedantic -std=c++2b>
  )

  target_link_libraries(${name}
    PRIVATE
      "${parsed_\[dependencies\]}"
  )

  install(TARGETS ${name}
    EXPORT
      ${name}-targets
    LIBRARY DESTINATION
      "${CMAKE_INSTALL_LIBDIR}"
    ARCHIVE DESTINATION
      "${CMAKE_INSTALL_LIBDIR}"
  )

  install(EXPORT ${name}-targets
    FILE
      ${name}-targets.cmake
    NAMESPACE
      ${name}::
    DESTINATION
     "${CMAKE_INSTALL_LIBDIR}/cmake/targets/${name}"
  )

  include(CMakePackageConfigHelpers)

  write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/${name}-config-version.cmake"
    VERSION
      ${PROJECT_VERSION}
    COMPATIBILITY
      SameMajorVersion
  )

  configure_package_config_file(
    "${PROJECT_SOURCE_DIR}/cmake/${name}-config.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${name}-config.cmake"
    INSTALL_DESTINATION
      "${CMAKE_INSTALL_LIBDIR}/cmake/targets/${name}"
  )

  install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/${name}-config.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/${name}-config-version.cmake"
    DESTINATION
      "${CMAKE_INSTALL_LIBDIR}/cmake/targets/${name}"
  )

  export(EXPORT ${name}-targets
  FILE
    "${CMAKE_CURRENT_BINARY_DIR}/${name}-targets.cmake"
  NAMESPACE
    ${name}::
  )

  export(PACKAGE ${name})
endfunction()
