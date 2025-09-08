# Debugging GAS Assembler with gdb
# 02.010 Debugging with gdb

I don't like discussing registers in the abstract.  We are going to use debugging as a way to look at registers.

Also, this lets us cover debugging in small pieces rather than all at once.

## About `gdb`

The `gdb` program is actually designed for use with GNU C/C++.  We are hijacking it for use with assembler.


## Assemble with Debug Info

Use the `-g` flag to include debug information:

```bash
as -g program.s -o program.o
ld program.o -o program
```

## Start gdb

Launch `gdb` with your executable:

```bash
gdb ./add.exe
```

## 3. Useful gdb Commands

- `break <address>`: Set a breakpoint at a specific address.
- `disassemble`: Disassembles the .text area, but not the .data area.  Does not get any compiler directives or meta data. 
- `run`: Start the program.
- `stepi`: Step one instruction.
- `info registers`: View register values.
- `p/<format> <address>`: Examine memory  or register

## 4. Example Session

```bash
(gdb) break *_start
(gdb) run
(gdb) stepi
(gdb) info registers
(gdb) print/d $rax
(gbd) print/x (int)sum
```
### print/?

#### print formats

The ? represents the format of the output.  Here are some common formats we will be using soonish.

* `print/d` -- decimal.  This is the default, and the /d may be left off
* `print/x` -- hex
* `print/f` -- float
* `print/c` -- character (ASCII)
* `print/t` -- binary
  
#### Arguments

Registers should be prefixed with $


Registers have a fixed number of bytes, so we do not need to specify a size for them.

Memory locations are more complicated because we have to specify the size.  We can use the C/C++ data types.  Note that these are signed.  You may also use the "unsigned" modifier if it is justified.

x86_64|C/C++|Number of<br>bytes
---|---|:---:
.byte|char, byte|1
.word|short|2
.dword|int|4
.quad|long|8



```bash
(gdb) print $rax
$3 = 65
(gdb) print/c $rax
$4 = 65 'A'
(gdb) print/x $rax
$5 = 0x41
(gdb) print/t $rax
$6 = 1000001
(gdb) print/d (long long)sum
$7 = 70
(gdb) print/c (char)sum
$8 = 70 'F'
(gdb) print/f (double)sum
$9 = 3.4584595208887258e-322

```

## 5. Tips

- Use labels in your assembly for easier navigation.

- Use `list` to show source if available.
- Use `disassemble` to view instructions.

## References

- [GDB Documentation](https://www.gnu.org/software/gdb/documentation/)
- [GAS Manual](https://sourceware.org/binutils/docs/as/)
