cmake_minimum_required(VERSION 3.10)
project(AyucLox C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Include directories
include_directories(include)

# Source files
file(GLOB SOURCES "src/*.c")

# Main executable
add_executable(ayuclox ${SOURCES})

# Debug build configuration
option(DEBUG_BUILD "Build with debug information" OFF)
if(DEBUG_BUILD)
    target_compile_definitions(ayuclox PRIVATE DEBUG)
    target_compile_options(ayuclox PRIVATE -g)
endif()

# Enable all warnings
target_compile_options(ayuclox PRIVATE -Wall -Wextra)

# Testing option
option(BUILD_TESTS "Build with test flags" OFF)
if(BUILD_TESTS)
    target_compile_definitions(ayuclox PRIVATE TESTING)
endif()

# Install rules
install(TARGETS ayuclox DESTINATION bin)