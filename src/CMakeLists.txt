add_library(${NAME} STATIC)

target_sources(${NAME}
    PRIVATE
        hello.cc
)

target_include_directories(${NAME}
    PRIVATE
        ${CMAKE_CURRENT_LIST_DIR})

target_link_libraries(${NAME}
    PRIVATE
        proto-objects
        protobuf::libprotobuf)

set_target_properties(${NAME} PROPERTIES PUBLIC_HEADER "hello.hh")

install(TARGETS ${NAME})
