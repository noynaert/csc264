/*
   Demonstrates using a bitmask to determine if a number is even or odd.
   Uses full if...else structure

   Registers:
      R8 will hold the number being tested
      R9b will hold the label.

*/
.globl _start
.data  
   number: .quad 8
   eoMask: .quad 0x01
   label:  .byte 0x0 #will hold eithe "E" or "O" at the end of the program
   even:   .ascii "Even"
   odd:    .ascii "Odd"
.text
_start:
  
  # load the number into r8
  movq number, %r8

  # Begin if...else block
  andq eoMask,%r8 #mask the last bit.  Is it Zero?
  jnz _odd
  movb even, %r9b
  jmp _output
  _odd:     # else
  movb odd, %r9b

  _output:
  movb %r9b, label

_exit:
    movq $60, %rax
    movb  label, %dil
    syscall
