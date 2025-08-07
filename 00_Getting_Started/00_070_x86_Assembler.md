# 01.070 x86 Assembly Language

Assembly language is very close to machine language.  Generally, one assembly language statement becomes one machine instruction.

Assembly language is simple.  However, it is not intuitive.  Most of the learning involves learning how to interact with memory and system resources.

Assembly is a hard if you are not comfortable working in Binary, Hex, and Decimal number systems.


## Structure of the assembly language statement

There are two different forms of assembly language.  

* AT&T or GAS assemblers
* Intel assemblers

We will be using the AT&T or GAS form.  The assembly language statement has up to three parts.

* The command.  It is generally 3 letters
* The "source" argument appears first
* the "destination" argument appears second.

In the statement `mov $7, %di` it means "Move the literal value 7 into the di register."  The $ indicates a literal value, and the % indicates a register.

Case generally does not matter, but the tradition in AT&T/GAS assemblers is to use all lower case.

Intel assemblers reverse the order of the operands with the destination first and the source appearing second.  The symbols for registers and constants are different.  Intel assembly is typically done in upper case.

### Other elements in a complete program

```asm
.globl main
.section .text

main:
  mov $60, %ax    # Save EXIT (60) as the system call in AX register
  mov $7, %di     # Save the 7 error code for the return value
  syscall         # Use system call to exit with error code 7
```

# symbols or ; are used to mark comments

 There are some directives like the `.globl` and `.section` that control how the assemblers interprets the program.

 In this program `main` is used to specify the beginning statement in the program.  `_start` is often used instead of main 

Blank lines are used to visually divide up blocks of code, but the assembler ignores them.

Note that Assembler and Machine language may each be created from the other.  If you have Assembly language, the machine language can be generated.  It works the other way as well.  If you have Machine code, it may be used to create Assembly Language.
