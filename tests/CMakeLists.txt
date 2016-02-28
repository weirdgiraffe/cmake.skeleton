find_package(GTest REQUIRED)

include_directories(${GTEST_INCLUDE_DIRS})

add_executable(exampletest exampletest.cpp)
target_link_libraries(exampletest ${${PROJECT_NAME}_LIBS} ${GTEST_BOTH_LIBRARIES})

add_test(AllTests exampletest)

