# 03.050 XOR

A|B|A **^** B
---|---|:---:
0|0|0
0|1|1
1|0|1
1|1|0


XOR is a bitwise operator.  That means there is no carry-in or carry-out between the columns of bits.

XOR may occur between two registers or a register and a memory location.  It may not operate on two memory locations.

XOR has many uses, including uses in cryptography.  It is also useful for toggling a specific bit on and off.  However, our immediate use will be for clearing registers.

## Clearing Registers

### `movq 0 rax`

This method works.  However, it is slower than the method below, and the instruction is larger.  It uses more electrical energy as well.

### `xor` a register with itself

Logical operations like AND, OR, and XOR are done on a bitwise basis.  There is no carry-in or carry-out between columns

## XOR use

XOR has many uses, including in cryptography.  The operators may both be registers, or ***one*** of the operators may be a memory location.  XOR cannot have both operators be memory locations.

The source operand may be a literal.  It will usually be expressed in hex or binary unless it is an even power of 2.


