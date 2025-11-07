# 10.010 About Stacks

Stacks are an important concept in Computer Science.  They are also important in Operating Systems.  Stack operations are built into the structure of many CPU architecture.

Stacks are a data structure.   Data may be "pushed" onto the stack one piece of data at a time.  Data on the stack may be "popped" off one at a time.

The unique thing about a stack is that the first item that is pushed onto the stack will be the last data to pop off.  It effectively reverses the order.

## The usual analogy: Plate dispenser

[Plate dispenser video](https://youtube.com/shorts/P2x7ut4lysU?si=Cy1kR0JVsVOuhFe8)

Our limitation is that only one plate may be added or removed at a time.
## Top, but No Bottom

A stack has a "top" where data is added or removed.  But there is no "bottom".  In theory, a stack may grow as large as needed.  However, computers have limited memory, so a stack may run out of space.

When a stack runs out of space, this is called a "stack overflow".  This is a common programming error.  The system stack we are talking about in this chapter is surprisingly small by default.  On Linux, the default stack size for a program is often 8 megabytes.  This may seem like a lot, but it is easy to exceed this limit by using too much stack space in functions.  The stack size on Linux may be changed using the `ulimit` command.

## Sometimes, Stacks seem to grow downwards

We talk about stacks as if they grow upwards, with data being added to the "top" of the stack.  However, in many computer architectures, including x86-64, stacks grow downwards in memory.  This means that as data is pushed onto the stack, the memory addresses used decrease.

That means that when you push data onto the stack, the value of the stack pointer (RSP register) decreases, and when you pop data off the stack, the stack pointer increases.

This downward growth is just a convention used by many computer architectures.  The important thing to remember is that stacks operate on a Last-In, First-Out (LIFO) basis, regardless of the direction of growth in memory.

# RPN Logic as an example of Stack usage

RPN (Reverse Polish Notation) is a mathematical notation in which every operator follows all of its operands.  This notation is particularly well-suited for stack-based calculations.  RPN logic allows writing arithmetic expressions without the need for parentheses to define operation precedence.  In the following table, the equations in the left column are written in standard infix notation, while the right column shows their equivalent RPN expressions.

| Infix Notation    | RPN Expression |
| ----------------- | -------------- |
| 3 + 4             | 3 4 +          |
| 3 + (4 * 5)       | 3 4 5 * +      |
| (5 - 2) * 6       | 5 2 - 6 *      |
| 8 / (4 + 4)       | 8 4 4 + /      |
| (7 + 3) * (2 - 4) | 7 3 + 2 4 - *  |

To evaluate an RPN expression using a stack, follow these steps:
1. Read the RPN expression from left to right.
2. For each number encountered, push it onto the stack.
3. For each operator encountered, pop the required number of operands off the stack, perform the operation, and push the result back onto the stack.
4. After processing the entire expression, the

