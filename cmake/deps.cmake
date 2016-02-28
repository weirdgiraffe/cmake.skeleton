set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

#===================================#
#            Threads                #
#===================================#
set(CMAKE_THREAD_PREFER_PTHREAD true)
find_package(Threads REQUIRED)

#===================================#
#            Boost                  #
#===================================#
set(REQUIRED_BOOST_COMPONENTS program_options thread system timer)
if(WIN32)
	set(REQUIRED_BOOST_COMPONENTS ${REQUIRED_BOOST_COMPONENTS} chrono)
endif()
find_package(Boost 1.51.0 REQUIRED COMPONENTS ${REQUIRED_BOOST_COMPONENTS})

