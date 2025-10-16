# 07.020 Farewell,  `_start`, we barely knew ye

The following program calls the `puts` function.  However, linking and loading it is problematic.  This note is more about linking than it is about the program

```
/*
     Demonstrates use of puts

      gcc -g -Wa,-al -o start.exe  start.s > start.lst && ./start.exe
      -or-
      gcc start.s && ./a.out
*/

.globl main

.data
   message: .asciz "Hola."

.text
main:
  mov  $message, %rdi          # Address of message into %rdi
  call puts                    # puts(message)

_exit:
  movq $60, %rax
  movq $99, %rdi
  syscall
```

## The problem:  Linking

The problem I had was that the `ld` command does not reliably link the object file.  I got it to work on an Ubuntu system, but it did not work on my Fedora desktop.

One option is to use `gcc` to link the program.  It seems to work universally.

The issue with `gcc` is that it is C-focused.  It requires us to use `main` as the starting label instead of `_start`

## `gcc` as the only tool

We usually use `gcc` to compile and link C and C++ programs.  It is able to incorporate assembly language functions into the C program.  That means that `gcc` can call the assembler to handle the .s files.  If we don't supply any C or C++ files, we can use `gcc` to do both the assembly and the link.  

If we do not supply a an output file, `gcc` creates an output file called `a.out`.  That means we can  both assemble and link with just

```
gcc prog.s
```
Then we can execute the program with `./a.out`.  We can use the bash symbol && to do it all in one shot.

```
gcc prog.s && ./a.out
```
We can produce debugging information with -g.  If we want, we can specify the output file with -o.  That would give us:

```
gcc -o prog.exe -g prog.s
```

If you want a listing, it is a little more complicated.

```
gcc -g -Wa,-al -o prog.exe prog.s > prog.lst 2>&1 
```