cmake_minimum_required(VERSION 2.8)
set(PROJECT_NAME "example")

project(${PROJECT_NAME} C CXX)

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/deps.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/compiler.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/version.cmake")

configure_file("${PROJECT_SOURCE_DIR}/include/version.h.in" "${PROJECT_BINARY_DIR}/include/version.h")
message("-- Building ${PROJECT_NAME} version: ${VERSION_STR}")

#=============================================================================#
# add include directories here                                                #
# usage: include_directories(<includedir>)                                    #
#=============================================================================#

include_directories("${PROJECT_BINARY_DIR}/include")
include_directories("${PROJECT_SOURCE_DIR}/include")

#=============================================================================#
# add some definitions here                                                   #
# usage: add_definitions(<definition>)                                        #
#=============================================================================#

#=============================================================================#
# add additional libraries directories                                        #
# usage: link_directories(<libdir>)                                           #
#=============================================================================#

set (${PROJECT_NAME}_SOURCES ${PROJECT_SOURCE_DIR}/src/main.cpp
	                     ${PROJECT_BINARY_DIR}/include/version.h)

set (${PROJECT_NAME}_LIBS ${CMAKE_THREAD_LIBS_INIT}
	                  ${Boost_SYSTEM_LIBRARY})

# uncomment for executable
add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_SOURCES})

# uncomment if building a library
#add_library(${PROJECT_NAME} ${${PROJECT_NAME}_SOURCES})

# uncomment to link libraries to this project
target_link_libraries(${PROJECT_NAME} ${${PROJECT_NAME}_LIBS})

# uncomment to enable test execution througth `make test` command
enable_testing()
# uncomment to enable building of tests
add_subdirectory(tests)
