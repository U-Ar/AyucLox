#include <stdlib.h>

#include "memory.h"

void* reallocate(void* pointer, size_t oldSize, size_t newSize) {
    if (newSize == 0) {
        free(pointer);
        return NULL;
    }
    void *newPointer = realloc(pointer, newSize);
    if (newPointer == NULL) exit(1);
    return newPointer;
}