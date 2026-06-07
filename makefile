# Toolchain
CC = gcc
LD = ld

# Target architectures (Defaulting to 32-bit for standard OS/bootloader tutorials)
# Change -m32 to -m64 if you are targeting 64-bit Long Mode
ASFLAGS = -m32 -ffreestanding
LDFLAGS = -m elf_i386 --oformat binary -Ttext 0x1000

# Directory setup
SRC_DIR = kernel/src
BUILD_DIR = build
TARGET = $(BUILD_DIR)/kernel.bin

# Track the single GNU Assembly file dynamically
SRC = $(wildcard $(SRC_DIR)/*.s)
OBJ = $(BUILD_DIR)/kernel.o

# Default rule
all: $(BUILD_DIR) $(TARGET)

# Create build directory safely
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Link the object file into a raw, flat binary image
$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) -o $(TARGET) $(OBJ)

# Assemble the GNU .s file using GCC wrapper
$(OBJ): $(SRC) | $(BUILD_DIR)
	$(CC) $(ASFLAGS) -c $< -o $@

# Clean up build artifacts
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
