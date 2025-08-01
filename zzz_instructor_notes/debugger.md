# Debugging NASM

[https://www.reddit.com/r/asm/comments/ba4qi9/debugging_nasm/](https://www.reddit.com/r/asm/comments/ba4qi9/debugging_nasm/)

First, you need to let nasm generate debug information for you. Do this by passing -gdwarf to nasm. This generates debug information in the dwarf format.

You can then debug your program with gdb, the GNU debugger. kdbg is a graphical frontent for gdb; I advise you to go with gdb in the beginning.


USE GHEX for reading files.