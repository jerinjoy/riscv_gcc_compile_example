# Makefile for compiling a RISC-V assembly program and generating disassembly

TARGET = main
CC = riscv64-unknown-elf-gcc
OBJDUMP = riscv64-unknown-elf-objdump
ASFLAGS = -nostartfiles -nostdlib -march=rv64imac -mabi=lp64
DISASM = $(TARGET).dis

all: $(TARGET) $(DISASM)

$(TARGET): $(TARGET).s
	$(CC) $(ASFLAGS) -o $(TARGET) $(TARGET).s

$(DISASM): $(TARGET)
	$(OBJDUMP) -d $(TARGET) > $(DISASM)

clean:
	rm -f $(TARGET) $(DISASM)
