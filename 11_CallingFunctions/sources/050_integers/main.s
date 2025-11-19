/*
 * file: main.c
 *
 * Illustrates development of homework 11.  Homework 11 gets two integers from the keyboard and then sums them.
 *
 * This program illustrates how I approached the problem with an emphasis on using
 *function calls for major tasks.
 *
 * The main.s filehas three variables and two format statments.
 *
 * I made life more difficult for myself by adding 16-bit integers.Your assignment will be simpler if you use quads.
 *
 */

.globl main
.data
  first:  .word  0   # holds the first operand to be added
  second: .word  0   # holds the second operand to be added
  sum:    .long  0   # holds the sum of the two integers
  operandFormat: .asciz "The operand is %d\n" # For debugging to confirm the integers were read correctly
  sumFormat: .asciz "The sum of %d and %d is %d\n" # Report the final results

.text
main:
     nop     #for debugging, mainly to catch an initial breakpoint
     subq $8, %rsp    #align to 16-byte boundary
     # call getInteger function.  It will return an integer in %rax.  Save %rax to first
     # print first just to make sure it is working
     call getInteger
     movw %ax, first

     #report the integer for debugging
     movq $operandFormat, %rdi
     xor %rsi, %rsi
     movw first, %si
     xorq %rax, %rax
     call printf


      call getInteger # It will return an integer in %rax.  Save %rax to second.
      movw %ax, second
 #report the integer for debugging
     movq $operandFormat, %rdi
     xor %rsi, %rsi
     movw second, %si
     xorq %rax, %rax
     call printf


     # printsecond just to make sure it is working

     # sum the two integers.  Save %rax to sum
     # print the results

     #exit

     # During development, move the last byte of an operand or integer to the exit code for debugging
     # After completion,change to quit0.
     movb %al, %dil
     call quitCustom
