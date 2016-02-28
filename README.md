#This is a simple skeleton for CMake projects

## Some Cmake commands:

- with ninja: `cmake -G Ninja ..`
- using clang as a compiler: `source clang.env; mkdir build; cd build; cmake ..`
- using cgcc explicitely as a compiler: `source gcc.env; mkdir build; cd build; cmake ..`
- generate build files for debug version: `cmake -DCMAKE_BUILD_TYPE=Debug`
- generate build files for release version: `cmake -DCMAKE_BUILD_TYPE=Release`
- compile : `cmake --build .`

## Additional Find-scripts for CMake:

- cmake/FindCheck.cmake search for Check - [unit testing framework for C](https://github.com/libcheck/check)

