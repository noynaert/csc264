/*
Demonstrates how functions keep track of their own execution context using the call stack.
*/
#include <stdio.h>

void functionA(int a, int b);
void functionB(int q);
long recursiveFactorial(long n);

int main() {
    puts("Starting main function");
    functionA(3,4);
    puts("Back in main function");

    return 0;
}

void functionA(int a, int b) {
    int sum = a+b;  // local variable goes on the stack
    printf("In functionA: a=%d, b=\%d sum=%d\n", a, b, sum);
    functionB(sum);
        long result = recursiveFactorial(5);
        printf("Factorial result: %d\n", result);

}

void functionB(int q){
    printf("In functionB: q = %d\n", q);
}
 long recursiveFactorial(long n) {
    printf("Calculating factorial of %d\n", n);
    if (n <= 1) {
        return 1;
    } else {
        puts("Calling functionB for no reason from inside recursiveFactorial");
        functionB(n);  // Just to demonstrate stack behavior
        return n * recursiveFactorial(n - 1);
    }
    
}

