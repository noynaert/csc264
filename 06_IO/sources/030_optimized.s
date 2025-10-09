/*
    Syscall write a null-terminated string to the console

    This program optimizes the loop by moving the statements that store constants in registers.
    The step of storing 1 in the rax was left in the loop because potentially the syscall might not return a 1.
*/

.globl _start
.data
  first:   .ascii "abcdefg\n\r"
  firstN: .quad  . - first
  last:   .asciz  "wxyz\n"
  empty:  .asciz  ""
.text
_start:

   # Write 'last' to the console one byte at a time until Zero is found.
   # Set up the writing loop
   movq $last, %rsi    #load the address of the buffer to be printed
   movq $1, %rdi            # Field descriptor of console is 1
   movq $1, %rdx            # print 1 byte
   

   _printTilZero:
   cmpb $0, (%rsi)         # if the address in rsi is pointing to zero,
   je   _endPrintTilZero   #    then jump to the end of the loop to exit
   movq $1, %rax            # Call the write routine with syscall

   syscall                 # call the write routine
   inc %rsi
   jmp _printTilZero

   _endPrintTilZero:

_exit:
  movq $60, %rax
  movq $0, %rdi
  syscall
