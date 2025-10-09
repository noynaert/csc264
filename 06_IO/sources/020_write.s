/*
    Syscall write with known number of bytes
*/

.globl _start
.data
  first:   .ascii "abcdefg\n\r"
  firstN: .quad  . - first
.text
_start:

   # Write 'first' to the console
   movq $1, %rax   # write operation is 1
   movq $1, %rdi   # file descriptor for console is 1
   movq $first, %rsi  # pointer to the buffer to be written
   movq  firstN, %rdx  # Number of bytes to write
   syscall

_exit:
  movq $60, %rax
  movq firstN, %rdi
  syscall
