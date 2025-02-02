#pragma once

#include <cstddef>

struct ProtoResponse {
    const char *data;
    size_t size;
    void (*free)(const char *);
};

ProtoResponse hello_world();
