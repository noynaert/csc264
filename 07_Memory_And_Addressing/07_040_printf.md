# 07.040 `printf`

The `printf` statement can take a variable number of parameters.  Because it does this, we have to clear the `rax` register before the call.

We are going to build this up.  Initially, our C code would look like the following:

```
    int number = 65;
    char *message = "Adios";
    
    printf("The number is %d.\n", number);
    printf("The number is %d.  In hex, it would be 0x%x.\n %s.\n", number, number, message);
```


```
.data
   number:.quad 65
   format: .asciz "The number is %d, or 0x%x in hex.\n%s\n"
   message: .asciz "Adios."

.text
main:

  # Call printf
  xor   %rax, %rax    #clear the rax register
  movq  $format, %rdi  #format is the first argument
  movq  number, %rsi   #the second arg matches %d
  movq  number, %rdx   #the third arg matches %x
  movq  $message,%rcx  #the fourth argument matches %s
  call  printf
  movq %rax, %r15               # save the return value
```

Note that the numbers themselves are loaded into the %d and %x fields.  However, for the strings, the address of the start of the string is copied.