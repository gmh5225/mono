# [[( and )]] are interpreted as whitespace outside of a string literal, so
# [[pub(link_libraries)]] becomes publink_libraries when we pass it to
# add_library and add_executable. Therefore, we need to use the same
# interpretation in cmake_parse_arguments.

set(mono_properties
  "link_options"
  "link_libraries"
  "compile_options"
  "compile_definitions"
  "include_directories"

  # The following are public equivalents of the above.
  "pub(link_options)"
  "pub(link_libraries)"
  "pub(compile_options)"
  "pub(compile_definitions)"
  "pub(include_directories)"
)
