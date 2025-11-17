/*
 *    getString.s
 *    Reads a string from standard input.
 *    The string reads until a non-digit character is encountered or the maximum length is reached.
 *
 *    Inputs:
 *       none
 *
 *    Outputs:
 *      %rax -
 *
 *    Clobbers:
 *      %rdi, %rsi, %rdx, %rcx, %rax, %r8
 *      r8 is used as the local representation of the buffer pointer.
 *      The other registers are clobbered as a result of function calls.  They follow fairly normal usage
 *
 *     Logic:
 *     This getInteger function calls two other functions:
 *        getString--Prompts the user and then gets a string from the user.  The string will include only digits
 *        stringToInt--Converts the string to an integer
 */
.globl getInteger

.data
      # buffer: .skip 6
      buffer: .asciz  "67000"
      maxLength: .quad 5   # room for 5 digits
.text
getInteger:
    nop
    sub $8, %rsp     #align the stack

    #call getString
    # movq $buffer, %rdi
    leaq   buffer, %rdi    #stringToInteger expects the address of the buffer in rdi
    call stringToInteger


   add $8, %rsp     #restore the stack
   ret
