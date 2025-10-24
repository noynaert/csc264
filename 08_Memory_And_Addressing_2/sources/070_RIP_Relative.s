/*
   calculating  loop through quad array
   RIP Relative example
*/

.globl main
.data
    years: .quad  1066, 1776, 1865, 1918, 1945, 2020, 2025
    yearsN:.quad  6
    format:   .asciz "The [%d] year is %d.\n"

.text
main:

  movq $0, %r14
  movq $years,%r15

  _printYears:
  cmpq yearsN(%rip),%r14
  je _endPrintYears
  xor %rax, %rax
  movq $format, %rdi
  movq %r14, %rsi
  movq 0(%r15,%r14,8), %rdx
  call printf
  inc %r14
  jmp _printYears

  _endPrintYears:

_exit:
   movq $60,  %rax
   xor  %rdi, %rdi
   syscall

