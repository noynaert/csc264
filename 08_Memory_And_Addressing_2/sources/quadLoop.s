/*
   calculating addresses
*/

.globl main
.data
    years: .quad  1066, 1492, 1776, 2020
    yearsN:.quad  4
    format:   .asciz "The year is %d.\n"
    index: .quad  2

.text
main:
//    andq  $-16,%rsp



/*
    xor %rax, %rax
    movq $format,%rdi
    movq years,%rsi
    call printf
*/
/*
    movq $1,  %r14
    movq $years, %r15
    xor %rax, %rax
    movq $format, %rdi
    #movq years,%rsi
    movq 8(%r15,%r14,8), %rsi
    call printf
*/
    movq $0, %r14    # INDEX of the loop in r14
    movq $years,%r15 # BASE of the array

    _printLoop:
    cmpq yearsN,%r14
    je _endPrintLoop
    xor %rax, %rax
    movq $format,%rdi
    movq (%r15,%r14,8), %rsi
    call printf
    inc %r14
    jmp _printLoop
    _endPrintLoop:


_exit:
   movq $60,  %rax
   xor  %rdi, %rdi
   syscall

