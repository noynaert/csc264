# 09.030 Stashing on the Stack

Here is a fragment the code from the previous example that uses LEA to loop through an array. We will modify it to use the stack to stash values as we process them.

```
# printf call for element of the array
    xor %rax, %rax
    movq $format, %rdi
    movq %rcx, %rsi
    movq (%r13), %rdx
    movq %rcx, tmp      #save the rcx before the call
    call printf
    movq tmp, %rcx      #restore the rcx after the call
```

In the last video, we saw that we had to save and restore the value in `rcx` around the `printf` call. This is because `printf` is a function call, and function calls can change the values in registers. We used a temporary variable in memory to save the value of `rcx` before the call and restore it after.

There is another potential problem. If we look at the cheat sheet, we see that `r15` may also be destroyed by a function call. We are using r15. So far, we have been lucky that `printf` has not changed the value in `r15`. But we cannot count on that. We need to save and restore `r15` as well.

To do this, we will use the stack. The stack is a region of memory that is used for temporary storage. We can push values onto the stack before a function call and pop them off after the call to restore their values.

To push a value onto the stack, we use the `push` instruction. This decrements the stack pointer (`rsp`) and stores the value at the new top of the stack. To pop a value off the stack, we use the `pop` instruction. This loads the value from the top of the stack into a register and increments the stack pointer.
Here is the modified code that uses the stack to save and restore `rcx` and `r15` around the `printf` call:

```
   # printf call for element of the array
    xor %rax, %rax
    movq $format, %rdi
    movq %rcx, %rsi
    movq (%r13), %rdx
    push %rcx         #save rcx on the stack
    push %r15         #save r15 on the stack
    call printf
    pop %r15          #restore r15 from the stack
    pop %rcx          #restore rcx from the stack
```

Note that we push `rcx` and `r15` onto the stack before the call to `printf`, and then pop them off in reverse order after the call. This ensures that the values are restored correctly.

## Stack Alignment

One important detail to note is that the stack must be aligned to a 16-byte boundary before a function call. This means that the value in `rsp` must be a multiple of 16. If it is not, we need to adjust it before the call.

In our example, we are pushing two 8-byte values onto the stack (`rcx` and `r15`), which means we are adding 16 bytes to the stack. This maintains the 16-byte alignment. However, if we were to push an odd number of values or values of different sizes, we would need to adjust the stack pointer accordingly.

There are techniques to ensure stack alignment. However, for now, we will assume that our code maintains proper alignment by pushing and popping values in pairs of 8 bytes. For now, make sure that we always push an even number of 8-byte values before a function call to maintain alignment.
