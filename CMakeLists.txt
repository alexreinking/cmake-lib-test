cmake_minimum_required(VERSION 3.31)

option(mylib_FETCH_VCPKG "When enabled, set up vcpkg using FetchContent" ON)

if (mylib_FETCH_VCPKG)
    include(FetchContent)
    FetchContent_Declare(
        vcpkg
        GIT_REPOSITORY https://github.com/microsoft/vcpkg.git
        GIT_TAG 6f29f12e82a8293156836ad81cc9bf5af41fe836  # 2025.01.13
    )
    FetchContent_MakeAvailable(vcpkg)

    set(CMAKE_TOOLCHAIN_FILE "${vcpkg_SOURCE_DIR}/scripts/buildsystems/vcpkg.cmake"
        CACHE FILEPATH "")
endif ()

project(
    mylib
    VERSION 0.1.0
    DESCRIPTION "MyLib test"
)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 23)

if (MSVC)
    add_compile_options(/utf-8)
endif ()

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

find_package(Protobuf CONFIG REQUIRED)

set(PROTO_DIR "${CMAKE_SOURCE_DIR}/proto")
set(PROTO_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated")

add_library(proto-objects OBJECT "${PROTO_DIR}/hello.proto")

target_link_libraries(proto-objects PUBLIC protobuf::libprotobuf)
target_include_directories(proto-objects PUBLIC "$<BUILD_INTERFACE:${PROTO_BINARY_DIR}>")

protobuf_generate(
    TARGET proto-objects
    IMPORT_DIRS "${PROTO_DIR}"
    PROTOC_OUT_DIR "${PROTO_BINARY_DIR}")

find_package(CGAL CONFIG REQUIRED)

add_subdirectory(src)
