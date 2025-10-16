# 07.010 C functions in Java

C was developed to write Unix.  Unix has many C commands built into Unix.  

One of the useful statements is printf.  I have adapted the [asm](https://raw.githubusercontent.com/noynaert/csc264/refs/heads/main/01_Number_Systems/source/asm) script to illustrate.

```
   echo "Exit code for the program is $code" | lolcat
   printf "The exit code for the program is %d\n" $code  | lolcat
```
Those programs may also be called as functions from assembler.

```c
/*
   cputs.c

   Illustrates calling puts
 */
#include <stdio.h>
int main()
{
  // using puts to print hello world
  int number = 99;
  char* str = "Hola";
  unsigned long long locationOfNumber = (unsigned long long) &number;  //Convert address of number to an (unsigned long long)

  puts(str);
  printf("The number is %d.  The number is stored at %d\n", number, locationOfNumber);
  return 0;
}
```
## `printf` Syntax

The printf statement must have a format string. 

- %d is the format specifier for all integer types including `byte`, `int`, `long`, and `long long` 
- `%d` is a placeholder for any integer type
- `%x` is used for hex notation for any integer type
- Integers must be provided for each of the parameters in the argument list following the format string
- `\n` is used for new line

