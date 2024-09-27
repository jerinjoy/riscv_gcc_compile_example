# RISC-V bare-metal compilation example.

## Install the toolchain on macOS

```shell
brew install riscv64-unknown-elf-gcc
```

## Compile the main.S

```shell
❯ make
riscv64-unknown-elf-gcc -nostartfiles -nostdlib -march=rv64imac -mabi=lp64 -o main.elf main.s
riscv64-unknown-elf-objdump -d main.elf > main.dis
```

