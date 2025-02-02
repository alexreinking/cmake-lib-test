add_library(mylib STATIC)

target_sources(mylib
    PRIVATE
        hello.cc
)

target_include_directories(mylib
    PRIVATE
        ${CMAKE_CURRENT_LIST_DIR})

target_link_libraries(mylib
    PRIVATE
        proto-objects
        protobuf::libprotobuf)

set_target_properties(mylib PROPERTIES PUBLIC_HEADER "hello.hh")

install(TARGETS mylib)
