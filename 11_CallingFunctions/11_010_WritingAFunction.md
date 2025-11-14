# 11.010 Writing A Function

## .globl

The `.globl` directive is used to declare a symbol (like a function name) as global, making it visible to the linker and other files. This is necessary for functions that will be called from other files.

## Caller file

```
/*
 *file: caller.s
 * Illustrates calling a function
 *
 *Assemble and link with gcc
*/
.globl main
.data
   starting: .asciz "Start"

.text
main:
    # Print starting message
    movq $starting, %rdi     # puts the address of the message in the rdi
    call puts

_exit:
#     movq %rax, %rdi    # put the return value of address into the rdi
#     movq $60, %rax
#     syscall

movq %rax, %rdi
call quitCustom
```

## Callee file

```
/*
 * file: quit.s
 *
 * Provides three exit functions
 *
 * quit0: Exits and Returns 0 to the OS
 * quit1: Exits and Returns 1 to the OS
 * quitCustom: Exits and Returns the contents of the %rdi register to the OS
 *
 *  Assemble with gcc
 */
.globl quit0
.globl quit1
.globl quitCustom

.text

# Function to exit with return code 0
quit0:              #
_exit:              #local only label
    movq $60, %rax
    movq $0 , %rdi
    syscall

# Function to return 1, indicating an error of unspecified origin
quit1:
    movq $60, %rax
    movq $1,  %rdi
    syscall

# Function to return the value in the %rdi register
quitCustom:
   movq $60, %rax
   syscall
```
