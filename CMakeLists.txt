cmake_minimum_required(VERSION 3.31)

set(NAME mylib)

include(FetchContent)
include(${CMAKE_SOURCE_DIR}/cmake/vcpkg.cmake)

project(${NAME}
    VERSION 0.1.0
    DESCRIPTION "MyLib test"
    LANGUAGES C CXX
)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 23)

set(CMAKE_CXX_FLAGS "/utf-8")
set(CMAKE_C_FLAGS "/utf-8")

if (MSVC)
    set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
endif()

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

include(${CMAKE_SOURCE_DIR}/cmake/protobuf.cmake)
find_package(CGAL CONFIG REQUIRED)

add_subdirectory(src)
