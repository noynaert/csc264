/******************************************************************************************
This program adds two integers and returns the sum to the operating system as the exit code.

File: hmwk01.s
Programmer:
Begun:  September 5, 2025

Assemble with GNU "as" assembler under Linux

*******************************************************************************************/

.globl _start

.data
  bigQ: .quad 0x0123456789abcdef

  decimalQ: .quad 255
  decimalL: .long 255
  decimalW: .word 255
  decimalB: .byte 255

  dummyQ:   .ascii "Hello"

.text
_start:
  # use syscall to exit and return sum as an exit code.  System.exit(sum)  sys.exit(sum)
  movq $0x3c, %rax   # Syscall instruction for exit
  movq %rax, %rdi    # Returning the value of the syscall
  syscall


/* Please answer the following questions.  You may type the answers.

Question 0:
In hmwk00, the equivalent line was "movq $60, %rax".  For hmwk01 the $60
is shown as $0x3c.  Are the two statements the same or is something different
going on?  Please explain your answer.


Question 1:
The homework.lst file shows the following:
   15 0000 EFCDAB89 	  bigQ: .quad 0x0123456789abcdef
   16      67452301
The 15 is the line number.  The 0000 indicates the address is 0000, or the start
of the data segment.  The contents of the memory are shown on two lines.
The EFCDAB8967452301 shows that the "least significant" bytes are shown first because
it shows EF. The order reflects how memory is organized on the x86 family of processors.
It looks backwards to humans who use left-to-right writing systems such as English.

Do the bits within a single byte also shown "backwards?" Explain and defend your
answer.


Question 2:
The following is from the listing file:
    15 0000 EFCDAB89 	  bigQ: .quad 0x0123456789abcdef
    15      67452301
    17 0008 FF000000 	  decimalQ: .quad 255
    17      00000000
    18 0010 FF000000 	  decimalL: .long 255
    19 0014 FF00     	  decimalW: .word 255
    20 0016 FF       	  decimalB: .byte 255

There are two line 15 and 17 because the memory field is on two lines.

a. There should be 64 bits in a quad.  The memory shows EFCDAB8967452301.
   Would that correspond to 64 bits?  Explain your answer.

b. Does the data on line 18 show the correct length for a long?  Explain.


c. Does the data on line 19 show the correct length for a word?  Explain.


d. Does the data on line 20 show the correct length for a byte?  Explain.


Question 3:
Look at the addresses on lines 15 through 22.  The addresses are
0000, 0008, 0010, 0014, 0016, and 0017.  Do those values look correct?


*/
