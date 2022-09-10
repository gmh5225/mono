option(${PROJECT_NAME}_BUILD_DOCS "Build ${PROJECT_NAME} documentation" OFF)

if(${PROJECT_NAME}_BUILD_DOCS)
  add_custom_target(doxygen
    COMMAND ${CMAKE_COMMAND} -E chdir ${PROJECT_SOURCE_DIR}/docs poxy
  )
endif()

