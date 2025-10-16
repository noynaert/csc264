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
  mov  $message, %rdi          # Address of message into %rdi
  call puts                    # puts(message)
  movq %rax, %r15               # save the return value  

_exit:
  movq $60, %rax
  movq %r15, %rdi
  syscall

