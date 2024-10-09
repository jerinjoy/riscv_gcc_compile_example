# Makefile for compiling a RISC-V assembly program and generating disassembly


TARGET = main
CC = riscv64-unknown-elf-gcc
OBJDUMP = riscv64-unknown-elf-objdump

# Flags for 32-bit compilation
ASFLAGS32 = -nostartfiles -nostdlib -march=rv32i -mabi=ilp32
ELF32 = $(TARGET)_rv32.elf
DISASM32 = $(TARGET)_rv32.dis

# Flags for 64-bit compilation
ASFLAGS64 = -nostartfiles -nostdlib -march=rv64i -mabi=lp64
ELF64 = $(TARGET)_rv64.elf
DISASM64 = $(TARGET)_rv64.dis

# Build both 32-bit and 64-bit versions
all: $(ELF32) $(DISASM32) $(ELF64) $(DISASM64)

# Compile and disassemble 32-bit version
$(ELF32): $(TARGET).s
	$(CC) $(ASFLAGS32) -o $(ELF32) $(TARGET).s

$(DISASM32): $(ELF32)
	$(OBJDUMP) -d $(ELF32) > $(DISASM32)

# Compile and disassemble 64-bit version
$(ELF64): $(TARGET).s
	$(CC) $(ASFLAGS64) -o $(ELF64) $(TARGET).s

$(DISASM64): $(ELF64)
	$(OBJDUMP) -d $(ELF64) > $(DISASM64)

# Clean up generated files
clean:
	rm -f $(ELF32) $(DISASM32) $(ELF64) $(DISASM64)

