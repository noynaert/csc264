/* 
Demonstrates how functions keep track of their own execution context using the stack.  
*/
#include <stdio.h>

void functionA(int a, int b);
int functionB(int q);
long functionC(long n);

int main() {
    puts("Starting main function");
    functionA(3,4);
    puts("Back in main function");

    return 0;
}

void functionA(int a, int b) {
    int sum = a+b;  // local variable goes on the stack
    printf("In functionA: a=%d, b=%d sum=%d\n", a, b, sum);
    functionB(sum);
        long result = functionC(5);
        printf("result of C from B: %d\n", result);
}

int functionB(int q){
    printf("In functionB: q = %d\n", q);
    return q;  // Just a dummy return value
}

 long functionC(long n) {
    printf("In functionC with n = %d\n", n);
    if (n < 1) {
        puts("Calling functionB for no reason from inside recursiveFactorial");
        return 1;
    } else {
        functionB(n);  // Just to demonstrate stack behavior
        //main(); // Would cause stack overflow
        functionA(1, 2); //Would also cause stack overflow
        return functionC(n - 1);
    }

}

