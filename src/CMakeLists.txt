add_library(mylib_mylib STATIC)
add_library(mylib::mylib ALIAS mylib_mylib)

set_target_properties(
    mylib_mylib
    PROPERTIES
    OUTPUT_NAME mylib
    EXPORT_NAME mylib
)

target_sources(
    mylib_mylib
    PRIVATE
    hello.cc
)

target_sources(
    mylib_mylib
    PUBLIC
    FILE_SET HEADERS
    FILES hello.hh
)

target_link_libraries(mylib_mylib PRIVATE mylib::protos)

install(TARGETS mylib_mylib)
