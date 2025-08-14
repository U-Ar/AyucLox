CC = cc
CFLAGS = -Wall -Wextra -std=c99 -I include
STRICT_CFLAGS = -Wall -Wextra -Werror -std=c99 -I include
BUILD_DIR = build
SRC_DIR = src
OBJ_DIR = $(BUILD_DIR)/obj
TARGET = $(BUILD_DIR)/main
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))

.PHONY: all clean run test debug

all: $(TARGET)

$(TARGET): $(OBJ_FILES) | $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

run: $(TARGET)
	./$(TARGET)

test: $(TARGET)
	./$(TARGET) --test

debug: CFLAGS += -g -DDEBUG
debug: clean all

clean:
	rm -rf $(BUILD_DIR)