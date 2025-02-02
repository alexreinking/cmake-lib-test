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

find_package(Protobuf REQUIRED)
find_package(CGAL REQUIRED)

set(PROTO_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated")

add_library(proto-objects OBJECT proto/hello.proto)
target_link_libraries(proto-objects PUBLIC protobuf::libprotobuf)
target_include_directories(proto-objects PUBLIC "$<BUILD_INTERFACE:${PROTO_BINARY_DIR}>")

protobuf_generate(
    TARGET proto-objects
    IMPORT_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/proto"
    PROTOC_OUT_DIR "${PROTO_BINARY_DIR}"
)
add_subdirectory(src)
