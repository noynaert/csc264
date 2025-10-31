/* 
   Loop using LEA and stack
*/
.globl main
.data
    numbers: .quad 16, 32, 48, 64, 80 , 96, 112 
    size: .quad .-numbers
    format: .asciz "Element [%d] is %d. The subtotal is %d\n"
    formatResult: .asciz "\nThe total is %d.\n"


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
    movq %r14, %r13    # set r13, the address of the number to be added
                       #          is initially set to the base of the array.


    ## loop through elements of the array, printing as we go
    ## Assumes there is one element to print

    _printElement:

    # add the current number (pointed to by r13) to the running total in rbx
    add  (%r13), %rbx

    # printf call for element of the array
    xor %rax, %rax
    movq $format, %rdi
    movq %rcx, %rsi
    movq (%r13), %rdx
    push %rcx        #save the rcx register before the call
    push %r15        #save the r15 register before the call
    movq %rbx, %rcx  #move the subtotal in the rbx to the 4th argument
    call printf
    pop  %r15        #restore r15 after the call
    pop  %rcx        #restore rcx after the call
    #Set up for test and next iteration
    incq %rcx
    leaq (%r14, %rcx, 8), %r13 #load the next element into r13

    #test for end of loop
    cmpq %r15, %r13
    jl  _printElement
    _endPrintElement:

    #print the final total
    xor %rax, %rax
    movq $formatResult, %rdi
    movq %rbx, %rsi
    call printf

_exit:
    movq $60, %rax
    xorq %rdi, %rdi
    syscall
