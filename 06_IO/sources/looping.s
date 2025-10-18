 /*
   Illustrates looping through a buffer with counting
   Also, only processes a range.  It 

   file: looping.s

   compiles and links with gcc.  
   Change "main" to "_start" if using as and ld

          Registers: 
             r15 -- Loop counter
             rsi -- Used to point to the next character to print (Not just for syscalls)

*/

.globl main
.data
      buffer: .ascii "(How), Now, \n[BrOwN] {CoW}!~@.123"
  

.text
main:

_exit:
  movq $60, %rax
  movq %r15, %rdi
  syscall

