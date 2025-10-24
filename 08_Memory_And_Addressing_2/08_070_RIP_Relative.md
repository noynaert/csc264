# 08.070 Rip Relative Addressing

# RIP Relative

"RIP Relative Addressing" is a programming style that improves security and helps shared libraries work together.

RIP Relative is a good thing.  I have not taught it until now for a few reasons:

- the GAS assembler does RIP-Relative Addressing by default when it is in 64-bit mode.
- It looks like mystery code to new Assembly students
- We did not have a basis to understand what it means.

## What it means

We learned about the `%rip` register when we were doing jump instructions.  The "Instruction Pointer" register contains the next address to be executed. (On ARM and some other systems the Instruction Pointer is known as the "Program Counter.")

Let's look at RIP and non-RIP coding.  The following instructions are equivalent:

| Non-RIP          | RIP Relative           |
| :--------------- | :--------------------- |
| movq years, %rax | movq years(%rip), %rax |

In RIP Relative addressing, we add `(%rip)` after labels in immediate addresses.  

We are adding the RIP register as the base address.  The system calculates an offset from the RIP.  The offset may be a positive or a negative integer.  

## Why it is important

Without RIP Relative addressing, the data is stored at fixed locations in memory.  This makes it difficult for routines that share the same data.  

A second important reason is that RIP Relative increases security.  If data always loads at the same place in memory, it is easy to attack that memory location.  RIP Relative makes it much harder for attackers to locate the data fields.  It also means that compromising one part of a shared library does not automatically break all the shared programs that use that data.

## PIC and PIE

Two related concepts are PIC and PIE.  The "C" stands for coding.  The "E" stands for Executable.  Human programmers do PIC.   When PIC code is assembled or compiled it becomes PIE.

## Advantages for PIC and PIE

Position-independent code (PIC) and position-independent executables (PIE) are essential for modern computing security and memory management.

Relocatability: Since memory addresses are calculated relative to the instruction pointer, the entire block of code and data can be moved anywhere in memory without having to change the code itself. This is crucial for shared libraries, which must be loaded at different, non-overlapping memory addresses for different programs.

Address Space Layout Randomization (ASLR): PIC and PIE are essential for implementing ASLR, a security feature that randomizes the starting memory addresses of an executable and its libraries. This makes it more difficult for an attacker to predict the location of code and exploit memory vulnerabilities.

Shared Memory: With PIC, shared libraries can be truly shared in memory among different processes. Since the code is position-independent, the operating system can map the same physical memory pages containing the library's instructions into the virtual address space of multiple programs. This reduces the overall memory usage of the system. 
## RIP-relative vs. PC-relative

On the x86-64 architecture, the instruction pointer register is named RIP (Relative Instruction Pointer). This makes "RIP-relative" the specific term for PC-relative addressing on this platform. The general concept, however, is called "PC-relative" and is used on many different architectures (such as ARM). 

## In Practice

For this class, and for now, when you use a label in Memory Mode addressing, you should put `(%rip)` after it.

Do not put it after labels in Immediate mode

| Code                  | Explanation                                |
| :-------------------- | :----------------------------------------- |
| movq years(%rip),%rdi | # This is in memory mode                   |
| movq $year, %rdi      | # No rip here because it is immediate mode |

## Code

```
/*
   calculating  loop through quad array
   RIP Relative example
*/

.globl main
.data
    years: .quad  1066, 1776, 1865, 1918, 1945, 2020, 2025
    yearsN:.quad  6
    format:   .asciz "The [%d] year is %d.\n"

.text
main:

  movq $0, %r14
  movq $years,%r15              # No RIP because of immediate address

  _printYears:
  cmpq yearsN(%rip),%r14        # RIP here
  je _endPrintYears
  xor %rax, %rax
  movq $format, %rdi
  movq %r14, %rsi
  movq 0(%r15,%r14,8), %rdx
  call printf
  inc %r14
  jmp _printYears

  _endPrintYears:

_exit:
   movq $60,  %rax
   xor  %rdi, %rdi
   syscall


```