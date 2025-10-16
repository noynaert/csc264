/*
 *   cDemo.c
 *
 *   Illustrates C output
 */

// Low level, high level language

#include <stdio.h>

int main(int argc, char** argv){
   int number = 99;
   char word[] = "Something";
   char*  greeting = "Hello, World";   //Pointer to a character
                                      //Another way to make an array of strings
   unsigned long long locationOfNumber = (unsigned long long) &number;  //Address of number

   puts(word);
   printf("The number is %d. It is located at 0x%x.\n", number);

  return 0;  //exit code for operatings
}
