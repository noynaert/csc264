/*
 * file: getInteger.s
 *
 * Reads an integer from the user and returns it in the %ax register.
 *
 * Assemble with gcc.
 *
 * GetInteger mainly calls two functions.  First, it calls getString to read a string from the user.
 * Then, it calls stringToInteger to convert that string to an integer.
 *
 * Inputs:
 *   None
 * Outputs:
 *   %ax - 16-bit integer read from user
 *
 * Clobbers:
 *   %rax, %rcx, %rdx, %rdi, %rsi, %r8
 *   (All registers clobbered by getString and stringToInteger)
 *
 */
.globl getInteger

.data
    #buffer: .skip 7   #to hold the string
    buffer: .asciz "abc\0\0\0"
    maxLen: .quad 6
.text

getInteger:
    nop
    subq $8, %rsp               # Align stack to 16-byte boundary
    
    # Get string from user
    leaq buffer, %rdi
    movq maxLen, %rsi
    call getString

    # Convert string to integer
    movq $buffer, %rdi          # Pointer to string
    call stringToInteger
    
    addq $8, %rsp               # Restore stack alignment
    ret
