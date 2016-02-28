# Set proper windows build target
if (WIN32)
    macro(get_WIN32_WINNT version)
        if (WIN32 AND CMAKE_SYSTEM_VERSION)
            set(ver ${CMAKE_SYSTEM_VERSION})
            string(REPLACE "." "" ver ${ver})
            string(REGEX REPLACE "([0-9])" "0\\1" ver ${ver})
            set(${version} "0x${ver}")
        endif()
    endmacro()
    get_WIN32_WINNT(ver)
    add_definitions(-D_WIN32_WINNT=${ver})
endif()

if (NOT CMAKE_CONFIGURATION_TYPES AND NOT CMAKE_BUILD_TYPE)
   set (CMAKE_BUILD_TYPE RelWithDebInfo)
endif ()

if ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
#=============================================================================#
#   preprocessor definitions for gcc                                          #
#=============================================================================#
    set (GCC_FLAGS_COMMON "-fmessage-length=0")
    
    execute_process (COMMAND ${CMAKE_C_COMPILER} -dumpversion
                    OUTPUT_VARIABLE GCC_VERSION)
    if (GCC_VERSION MATCHES "4.8")
        set (GCC_FLAGS_COMMON ${GCC_FLAGS_COMMON} -Wno-unused-local-typedefs)
    endif()

    set(CMAKE_CXX_FLAGS_DEBUG          "${GCC_FLAGS_COMMON} -g -O0 " )
    set(CMAKE_CXX_FLAGS_RELEASE        "${GCC_FLAGS_COMMON} -O2" )
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${GCC_FLAGS_COMMON} -O2 -g")

    set(CMAKE_C_FLAGS_DEBUG            "${GCC_FLAGS_COMMON} -g -O0" )
    set(CMAKE_C_FLAGS_RELEASE          "${GCC_FLAGS_COMMON} -O2" )
    set(CMAKE_C_FLAGS_RELWITHDEBINFO   "${GCC_FLAGS_COMMON} -O2 -g")

elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang")
#=============================================================================#
#   preprocessor definitions for clang                                        #
#=============================================================================#
    set (CLANG_FLAGS_COMMON "-fmessage-length=0")

    set(CMAKE_CXX_FLAGS_DEBUG          "${CLANG_FLAGS_COMMON} -g -O0 " )
    set(CMAKE_CXX_FLAGS_RELEASE        "${CLANG_FLAGS_COMMON} -O2" )
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CLANG_FLAGS_COMMON} -O2 -g")
    
    set(CMAKE_C_FLAGS_DEBUG            "${CLANG_FLAGS_COMMON} -g -O0" )
    set(CMAKE_C_FLAGS_RELEASE          "${CLANG_FLAGS_COMMON} -O2" )
    set(CMAKE_C_FLAGS_RELWITHDEBINFO   "${CLANG_FLAGS_COMMON} -O2 -g")

elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "MSVC")
#=============================================================================#
#   preprocessor definitions for visual studio                                #
#=============================================================================#
    
endif()
