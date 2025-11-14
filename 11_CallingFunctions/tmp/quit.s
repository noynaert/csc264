/*
 * quit.s
 *
 * Defines two functions to terminate the program:
 * - quitCustom: exits with status code in %rdi
 * - quit0: exits with status code 0 (indicating success)
 * - quit1: exits with status code 1 (indicating failure)
 */
.globl quitCustom
.globl quit0
.globl quit1
.text

quitCustom:
    _exitCustom:     # this is not globally visible.  It is a local label only
    movq $60, %rax      # syscall: exit
    movq $1, %rdi       # exit status
    syscall
    # No need for ret since syscall does not return

quit0:
    movq $60, %rax      # syscall: exit
    movq $0, %rdi       # exit status
    syscall
    # No need for ret since syscall does not return

quit1:
    movq $60, %rax      # syscall: exit
    movq $1, %rdi       # exit status
    syscall
    # No need for ret since syscall does not return