/* 
   Loop using LEA and stack
*/
.globl main
.data
    numbers: .quad 16, 32, 48, 64, 80 , 96, 112 
    size: .quad .-numbers
    format: .asciz "Element [%d] is %d\n"
    tmp: .quad 0


.text
main:
    #rbx = sum so far
    #rcx = index
    #r10 = holds the value of the size
    #r13 = current element
    #r14 = base address of array
    #r15 = end address of array

    ###  Setup for the loop

    #Store the base address of the array in r14
    leaq numbers(%rip), %r14

    #Store the end address of the array in r15
    movq  size,%r10   #Move the of bytes in the array into r15
    leaq  numbers(,%r10,1), %r15  #calculates the end of the array by adding size plus the base address

    ## initialize the loop control variables
    xor %rbx, %rbx     # zero out the rbx
    xor %rcx, %rcx     # zero out the rcx
    movq %r14, %r13


    ## loop through elements of the array, printing as we go
    ## Assumes there is one element to print

    _printElement:
    # printf call for element of the array
    xor %rax, %rax
    movq $format, %rdi
    movq %rcx, %rsi
    movq (%r13), %rdx
    movq %rcx, tmp      #save the rcx before the call
    call printf
    movq tmp, %rcx      #restore the rcx after the call

    #Set up for test and next iteration
    incq %rcx
    leaq (%r14, %rcx, 8), %r13 #load the next element into r13

    #test for end of loop
    cmpq %r15, %r13
    jl  _printElement
    _endPrintElement:


_exit:
    movq $60, %rax
    xorq %rdi, %rdi
    syscall
