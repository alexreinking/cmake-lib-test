add_library(mylib STATIC)

target_sources(
    mylib
    PRIVATE
    hello.cc
)

target_sources(
    mylib
    PUBLIC
    FILE_SET HEADERS
    FILES hello.hh
)

target_link_libraries(
    mylib
    PRIVATE
    proto-objects
    protobuf::libprotobuf
)

install(TARGETS mylib)
