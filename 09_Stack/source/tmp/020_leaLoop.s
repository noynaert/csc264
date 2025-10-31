/* 
   Illustrates LEA vs MOV
*/
.globl main
.data
    numbers: .quad 16, 32, 48, 64, 80 , 96, 112 
    size: .quad .-numbers
    format: .asciz "Element [%d] is %d\n"
    tmp: .quad 0

.text
main:
    #r10 = temporary use
    #r13 = current element
    #r14 = base address of array
    #r15 = end address of array
    #rbx = sum so far
    #rcx = index




    _printElement:
    # printf call for element of the array
    xor %rax, %rax
    movq $format, %rdi
    movq %rcx, %rsi
    movq (%r13), %rdx
    pushq %rcx
    pushq %r15
    #movq %rcx, tmp
    call printf
    popq %r15
    popq %rcx
    #movq tmp, %rcx

    #increment index
    incq %rcx
    leaq (%r14, %rcx, 8), %r13  #load next element using LEA addressing mode
    cmpq %r15, %r13
    jl _printElement
    _endprintElement:

_exit:
    movq $60, %rax
    xorq %rdi, %rdi
    syscall
