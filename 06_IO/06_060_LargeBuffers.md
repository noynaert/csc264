# 06.040 Large Buffers

Large buffers are often put in the `.bss` section of a program. The `.bss` section is used for uninitialized global and static variables, which allows the program to allocate large amounts of memory without increasing the size of the executable file.

## Example
```asm
.bss