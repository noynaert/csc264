# 10.020 Functions and the Stack

When a function is called, a new stack frame is created on the call stack.  This stack frame contains all the local variables and parameters for that function.

When the function completes, its stack frame is popped off the call stack, and control returns to the point where the function was called.

Consider the following code:

```c
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
        return functionC(n - 1);
    }
}
```
produces the following output:

```
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
        return functionC(n - 1);
    }

}

Starting main function
In functionA: a=3, b=4 sum=7
In functionB: q = 7
In functionC with n = 5
In functionB: q = 5
In functionC with n = 4
In functionB: q = 4
In functionC with n = 3
In functionB: q = 3
In functionC with n = 2
In functionB: q = 2
In functionC with n = 1
In functionB: q = 1
In functionC with n = 0
Calling functionB for no reason from inside recursiveFactorial
result of C from B: 1
Back in main function



When you run this code, you will see how each function call creates a new stack frame, and how local variables are managed within those frames. The recursive calls to `functionC` illustrate how multiple stack frames can exist simultaneously, each with its own context.

The stack frames easily keep track of absurdly complex function calls and recursion, allowing each function to operate independently without interfering with others.