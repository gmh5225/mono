function(add_executable name)
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
  _add_executable(${name} ${modules} ${parsed_UNPARSED_ARGUMENTS})

  target_compile_options(${name}
    PRIVATE
      $<$<CXX_COMPILER_ID:MSVC>:/W4 /WX>
      $<$<CXX_COMPILER_ID:GNU>:-Wall -Wextra -Werror -pedantic>
      $<$<CXX_COMPILER_ID:Clang>:-Wall -Wextra -Werror -pedantic>
  )

  target_link_libraries(${name}
    PRIVATE
      "${parsed_\[dependencies\]}"
  )

  install(TARGETS ${name}
    EXPORT
      ${project_name}-targets
    RUNTIME DESTINATION
      "${CMAKE_INSTALL_BINDIR}"
  )
endfunction()
