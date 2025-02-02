#include "hello.hh"

ProtoResponse hello_world() {
    ProtoResponse response {
        .data = "Hello, World!",
        .size = 13,
        .free = nullptr
    };

    return response;
}
