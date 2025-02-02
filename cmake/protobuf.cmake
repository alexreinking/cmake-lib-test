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
