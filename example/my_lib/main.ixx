export module my_lib;
import <iostream>; // std::cout

namespace my_lib
{
  export auto hello()
  {
    return "Hello, world!";
  }
}
