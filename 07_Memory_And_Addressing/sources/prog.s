/*
     Demonstrates use of puts

      gcc -g -Wa,-al -o start.exe  start.s > start.lst && ./start.exe
      -or-
      gcc start.s && ./a.out
*/

.globl main

.data
   message: .asciz "Hola."

.text
main:
  movq $message, %rdi   # put the ADDRESS of the message in rdi
  call puts             # make the call to puts
  movq %rax, %r15       # save the value returned, just for fun.

_exit:
  movq $60, %rax
  movq %r15, %rdi
  syscall

