/*
  read 3 characters
*/

.globl _start

.data
    buffer: .skip 3,64 # buffer to hold characters
                       #    Initially filled with @@@
    bufferN:.quad 3
    prompt: .ascii "Enter three characters: "
    promptN: .quad .-prompt

.text
_start:
   #write the prompt
   movq $1, %rax
   movq $1, %rdi
   movq $prompt,%rsi
   movq  promptN,%rdx
   syscall

    # Read 3 characters from the console
    movq $0, %rax    #0 is the write function
    movq $1, %rdi    #1 is the field descriptor for console
    movq $buffer, %rsi #Load the address of the buffer into rsi
    movq bufferN, %rdx
    syscall

   #write the buffer  (echo what the user entered)
   movq $1, %rax
   movq $1, %rdi
   movq $buffer,%rsi
   movq  bufferN,%rdx
   syscall


_exit:
  movq $60, %rax
  movq $0, %rdi
  syscall
