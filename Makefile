# Makefile for compiling a RISC-V assembly program and generating disassembly

TARGET = main
CC = riscv64-unknown-elf-gcc
OBJDUMP = riscv64-unknown-elf-objdump
ASFLAGS = -nostartfiles -nostdlib -march=rv64imac -mabi=lp64
DISASM = $(TARGET).dis
ELF = $(TARGET).elf

all: $(ELF) $(DISASM)

$(ELF): $(TARGET).s
	$(CC) $(ASFLAGS) -o $(ELF) $(TARGET).s

$(DISASM): $(ELF)
	$(OBJDUMP) -d $(ELF) > $(DISASM)

clean:
	rm -f $(ELF) $(DISASM)
