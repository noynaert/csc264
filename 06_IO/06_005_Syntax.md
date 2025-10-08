# 06.005 New Syntax (for output)

## Declaring variables with `.ascii` and `.asciz

The .ascii directive is used to declare a string without a null terminator.  The .asciz directive is used to declare a string with a null terminator.

```assembly
                 	.data
    0000 616263   	  letters:   .ascii "abc"
    0003 78797A00 	  last:      .asciz "xyz"
```

## Calculating length of a string using `.`

A period (`.`) can be used to get the current address in the assembly code.  This can be used to calculate the length of a string by subtracting the starting address of the string from the current address.  The length must be set immediately after the string for this to work.

Note that the `.` is an assembler directive.  It only applies at the time the program is assembled.  It does not apply at runtime.

```assembly
                 	.data
    0000 616263   	  letters:   .ascii "abc"
    0003 03000000 	  len:       .quad . - letters
```
A longer example:

```assembly
                 	.data
    0000 0004     	  filler:    .word  1024
    0002 00080000 	  filler2:   .long  2048
    0006 616263   	  letters:   .ascii "abc"
    0009 03000000 	  len:       .quad . - letters
```

## Address of a label using `$`

The dollar sign (`$`) can be used to get the address of a label.  This includes labels for data.   In the above example, `$letters` would give the address of the string "abcdefg".


```assembly
    movq $letters, %rax   # rax = address of letters
```

## Dereferencing a pointer using `()`
Parentheses can be used to dereference a pointer.  This is similar to using `*` in C.

```assembly
    movq $letters, %rdi   # rax = address of letters
    movb (%rdi), %bl      # bl = first byte of letters (a)
```

The command `movq $letters, %rdi` means "move the address of letters into rdi".

The command `movb (%rdi), %bl` means "move the byte at the address in rdi into bl".
