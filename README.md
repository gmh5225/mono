# Mono

Simple, consistent, and powerful interface for CMake's built-in add_library() and add_executable() commands.

**Mono is early in development. You can use it, but it's not ready for production. Please report any bugs you find.**

## Features

* **Simple** - Mono is designed with simplicity in mind. Get started on a new project in seconds.

* **Consistent** - Mono provides a consistent interface for both libraries and executables. No more complicated boilerplate build scripts. Just declare your targets and Mono will take care of the rest.

* **Powerful** - Mono provides a powerful interface for CMake's built-in add_library() and add_executable() commands. It's easy to add custom build steps, link against external libraries, and more.

And so much more!

##### [Try me!](example/)
```cmake
add_library(my_lib
[[pub(include_directories)]]
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)

add_executable(my_app
[[link_libraries]]
  Qt6::Widgets
[[pub(link_libraries)]]
  my_lib
)
```

## Get started right away! 🚀

Add the following to your CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.24)
project(MyProject VERSION 1.0.0)

# Enables populating content at configure time
include(FetchContent)

# Populate Mono
FetchContent_Declare(mono
  GIT_REPOSITORY https://github.com/wroyca/mono.git
  GIT_TAG        main
)

# Ensures Mono have been populated
FetchContent_MakeAvailable(mono)

# Add Mono to your project
include(${mono_SOURCE_DIR}/mono.cmake)

# Add your library target
add_library(my_lib)

# Add your executable target
add_executable(my_app
[[link_libraries]]
  my_lib
)
```
**And that's it! You're ready to go! 🎉 🎉 🎉**


```bash
cmake -B build -S .
cmake --build build
```

##  Documentation

*TODO*

<!-- TODO:
* [Quickstart](docs/quickstart.md)
* [Reference](docs/reference.md)
* [FAQ](docs/faq.md)
-->
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

## Acknowledgements

Mono is inspired by [CMake's built-in add_library() and add_executable() functions](https://cmake.org/cmake/help/latest/command/add_library.html) and [CMake's built-in find_package() and fetch_content() functions](https://cmake.org/cmake/help/latest/command/find_package.html).
