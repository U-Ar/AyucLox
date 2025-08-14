# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

AyucLox is an implementation of a programming language interpreter/VM, likely inspired by the Lox language from Robert Nystrom's "Crafting Interpreters" book. The project appears to be in early development stages, focusing on bytecode chunk implementation for a virtual machine.

## Building and Running

### Building the Project

To build the project, you can use a standard C compiler:

```bash
# From the root directory
mkdir -p build
cc -I include -o build/main src/*.c
```

### Running the Project

```bash
# From the root directory
./build/main
```

## Code Architecture

### Core Components

1. **Bytecode Chunks**
   - A dynamic array implementation for storing bytecode instructions
   - Located in `include/chunk.h` and `src/chunk.c`
   - Main data structure is `Chunk` with operations:
     - `initChunk()`: Initialize a new chunk
     - `writeChunk()`: Append a byte to the chunk
     - `freeChunk()`: Free the chunk's memory

2. **Memory Management**
   - Custom memory management system for dynamic arrays
   - Located in `include/memory.h` and `src/memory.c`
   - Key functions:
     - `reallocate()`: Core memory allocation/deallocation function
     - Macros: `GROW_CAPACITY`, `GROW_ARRAY`, `FREE_ARRAY`

3. **OpCode System**
   - Currently only has `OP_RETURN` defined
   - Located in `include/chunk.h`

### Project Structure

- `include/`: Header files (.h)
  - `common.h`: Common includes and definitions
  - `chunk.h`: Chunk data structure and operations
  - `memory.h`: Memory management system

- `src/`: Implementation files (.c)
  - `chunk.c`: Chunk operations implementation
  - `memory.c`: Memory management implementation
  - `main.c`: Program entry point

## Debugging

No specific debugging tools or mechanisms are implemented yet.

## Development Notes

The repository is in early development. When adding new features, follow the existing code style:
- Header files in the `include/` directory
- Implementation files in the `src/` directory
- Function declarations in headers with implementation in corresponding .c files
- Use the memory management system for dynamic memory allocation