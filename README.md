# RISC-V bare-metal compilation example.

## Install the toolchain on macOS

```shell
brew install riscv-gnu-toolchain
```

## Compile the main.S

```shell
❯ make
riscv64-unknown-elf-gcc -nostartfiles -nostdlib -march=rv32i -mabi=ilp32 -o main_rv32.elf main.s
riscv64-unknown-elf-objdump -d main_rv32.elf > main_rv32.dis
riscv64-unknown-elf-gcc -nostartfiles -nostdlib -march=rv64i -mabi=lp64 -o main_rv64.elf main.s
riscv64-unknown-elf-objdump -d main_rv64.elf > main_rv64.dis
```

