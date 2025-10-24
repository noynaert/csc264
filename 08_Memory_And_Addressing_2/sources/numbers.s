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

    movq $1,  %r14
    movq $years, %r15
    xor %rax, %rax
    movq $format, %rdi
    #movq years,%rsi
    movq 8(%r15,%r14,8), %rsi
    call printf

    /*
    #print the third character (which will be base + 2)
    movq $2, %r15 #set index to r15
    xor %rax, %rax
    movq $format, %rdi
    movb animal, index(%sil)
    movb animal, index(%dl)
    movb animal, index(%cl)
    call printf
    */
_exit:
   movq $60,  %rax
   xor  %rdi, %rdi
   syscall

