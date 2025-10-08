# 06.010 `syscall`

Syscalls allow your program to interact with the kernel of the operating system.  

System calls are tied to the specific architecture and operating system.

[https://syscalls.w3challs.com/](https://syscalls.w3challs.com/) is a great resource to look up syscalls for different architectures.

## References

- [Linux System Call Table](https://filippo.io/linux-syscall-table/)
- [Syscalls for x86-64](https://syscalls.w3challs.com/?arch=x86_64)

[Link to Cheat-sheet](videoNotes/ex02Cheatsheet/cheatsheetExam02.pdf)

## `syscall` as a function

Syscall is effectively a function call.  For example, if the command to write was written in Python or Java it would look like this: 

```
    syscall(function,fileDescriptor, buffer,n)
```

However, we don't have parameters on the syscall command.  What we do instead is to use specific registers for parameters.  That is one reason we need a lot of registers on the x86_64 processor.
