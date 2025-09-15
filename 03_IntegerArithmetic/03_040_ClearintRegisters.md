# 03.040 Clearing Registers

## Clearing Registers

### `movq 0 rax`

### xor rax

Logical operations like AND, OR, and XOR are done on a bitwise basis.  There is no carry-in or carry-out between columns

XOR works on the full width of the register

A | A xor A
:---:|:---:
0|0
1|0
