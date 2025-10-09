/*
    Syscall write a null-terminated string to the console
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

   _printTilZero:
   cmpb $0, (%rsi)         # if the address in rsi is pointing to zero,
   je   _endPrintTilZero   #    then jump to the end of the loop to exit
   movq $1, %rax            # Call the write routine with syscall
   movq $1, %rdi            # Field descriptor of console is 1
   movq $1, %rdx            # print 1 byte
   syscall                 # call the write routine
   inc %rsi
   jmp _printTilZero

   _endPrintTilZero:

_exit:
  movq $60, %rax
  movq $0, %rdi
  syscall
