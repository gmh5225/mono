# Mono

Simple, consistent, and powerful interface for CMake's built-in add_library() and add_executable() functions.

**This is a work in progress, it's not ready for use yet.**

## Features

* **Simple** - Mono is designed to be simple to use, leaving you to focus on your project.

* **Backwards compatible** - Mono won't break your existing code. You can transition to Mono at your own pace.

* **Powerful** - Mono provides a powerful interface with a minimal amount of boilerplate. Source files, dependencies, and compile options are all specified in a single function call. See the [documentation](docs/spec.md) for more details.

<!-- TODO:

* **Flexible** - Mono is designed to be flexible and extensible. It is easy to add new features and customize the behavior of existing features.

-->

And so much more!

```cmake
add_library(mylib
[[standard]]
  cxx_std_17
[[link_options]]
  -Wl,--no-undefined
[[interface]]
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
  $<INSTALL_INTERFACE:include>
)
```

## Usage

Simply include the module in your CMakeLists.txt file. The module will automatically hook into the `add_library()` and `add_executable()` functions allowing you to use mono properties.

```cmake
cmake_minimum_required(VERSION 3.24 FATAL_ERROR)
project(MyProject LANGUAGES CXX VERSION 1.0.0)

# Including mono in our project
include(cmake/mono.cmake)

# Simple library to be used by other targets
add_library(mylib)

# Simple executable that uses the library we just created
add_executable(myexe
[[dependencies]]
  mylib
)
```

<!-- TODO:

### Advanced Usage

```cmake
# Add a new property to the mono::properties list
list(APPEND mono::properties [[my_custom_property]])

# Add a new function that will be called when the property is used
function(mono::on_my_custom_property target)
  message("my_custom_property was used for target ${target}")
endfunction()
```

-->

## License

Mono is licensed under the MIT License. See [LICENSE](LICENSE) for more information.

## Credits

Mono was created by [William Roy](https://www.github.com/wroyca).

## Acknowledgements

Mono is inspired by [CMake's built-in add_library() and add_executable() functions](https://cmake.org/cmake/help/latest/command/add_library.html) and [CMake's built-in find_package() and fetch_content() functions](https://cmake.org/cmake/help/latest/command/find_package.html).
