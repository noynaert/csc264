/*
  read up to 4096 bytes from the console and store it in buffer.

Registers:
   r15 is used to count the characters

*/

.globl _start

.bss
      buffer: .skip 4096

.data
    bufferN:.quad 0
    bufferMax: .quad 4096  #Limit user input.
    prompt: .ascii "Enter a sentence (no tabs) Enter to quit: "
    promptN: .quad .-prompt

.text
_start:
   # write the prompt
   movq $1, %rax
   movq $1, %rdi
   movq $prompt,%rsi
   movq  promptN,%rdx
   syscall

    # Read into a buffer.  Stop when ASCII code < 32 is read
    # movq $0, %rax
    movq $1, %rdi
    movq $buffer,%rsi
    movq $1, %rdx
    movq bufferN, %r15
    _readByChar:
    movq $0, %rax
    syscall
    cmpb $32, (%rsi)
    jb _endReadByChar
    inc %rsi
    inc %r15
    movq %r15, bufferN
    cmpq bufferMax, %r15
    je   _endReadByChar
    jmp  _readByChar
    _endReadByChar:

   #print
   movq $1, %rax
   movq $1, %rdi
   movq $buffer,%rsi
   movq  bufferN,%rdx
   syscall

_exit:
  movq $60, %rax
  movq $0, %rdi
  syscall
