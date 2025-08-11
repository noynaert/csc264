# README for the source code folder

Normally, as and GAS-style assemblers have an extension of `.s`.  They mark the starting point as `_start:`.

However, the SASM ide requires the files to have `.asm` extensions, and to begin at `main:`

Also, the declaration of the length had to be changed.

Both styles will compile and execute using the `as` assembler.  However, only the `.asm` files will work in SASM.
