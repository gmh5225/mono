module;
#include <iostream> // std::cout
export module lib;

export namespace lib
{
  void hello()
  {
    std::cout << "Hello, world! \n";
  }
}
