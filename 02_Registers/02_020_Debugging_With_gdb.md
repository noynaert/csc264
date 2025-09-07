# Debugging GAS Assembler with gdb
# 02.010 Debugging with gdb

I don't like discussing registers in the abstract


## 1. Assemble with Debug Info

Use the `-g` flag to include debug information:

```bash
as -g program.s -o program.o
ld program.o -o program
```

## 2. Start gdb

Launch `gdb` with your executable:

```bash
gdb ./program
```

## 3. Useful gdb Commands

- `break <address>`: Set a breakpoint at a specific address.
- `run`: Start the program.
- `stepi`: Step one instruction.
- `info registers`: View register values.
- `dump registers`: Another Way to view the registers
- `x/<format> <address>`: Examine memory (e.g., `x/4x $rsp`).

## 4. Example Session

```bash
(gdb) break *0x400080
(gdb) run
(gdb) stepi
(gdb) info registers
(gdb) x/8x $rax
```

## 5. Tips

- Use labels in your assembly for easier navigation.
- Use `list` to show source if available.
- Use `disassemble` to view instructions.

## References

- [GDB Documentation](https://www.gnu.org/software/gdb/documentation/)
- [GAS Manual](https://sourceware.org/binutils/docs/as/)