
/* Exploring suffixes with mov
   file: suffixes.s
   Assemble with GAS assembler
 */

.globl _start
.data
  num1:    .quad 0x7fffffffffffffff

.text
_start:
    # fill registers with markers
    movq num1, %rax
    movq %rax, %rbx
    movq %rax, %rcx
    movq %rax, %rdx

_break0:
   movq $0, %rax
   movl $0, %ebx
   movw $0, %cx
   movb $0, %dl

_exit:
    #Exit the program, returning the sum
    movq $60, %rax
    movq $0,   %rdi
    syscall
