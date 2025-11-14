Skip to content
Chat history

You said:
please give me an example of a call to a function from x86-64 assembly language using the GNU GAS assembler.
ChatGPT said:
Below is a clean, minimal x86-64 Linux GNU GAS (AT&T syntax) example showing:

Setting up arguments

Calling a function

Function prologue/epilogue

Returning a value

This is the kind of example you’d present in CSC 264.

✔️ 1. Complete Example Program
main calls add_two_numbers
    .globl  main
main:
    pushq   %rbp
    movq    %rsp, %rbp

    # --- Set up arguments for add_two_numbers ---
    # System V AMD64 ABI: 
    #   1st arg → %rdi
    #   2nd arg → %rsi
    movl    $40, %edi        # int a = 40
    movl    $2,  %esi        # int b = 2

    call    add_two_numbers  # result returned in %eax

    # --- Use result as return code for main ---
    movl    %eax, %edi       # move result to exit code
    movl    $60, %eax        # syscall: exit
    syscall                  # exit(result)
Function definition: int add_two_numbers(int a, int b)
    .globl  add_two_numbers
add_two_numbers:
    pushq   %rbp
    movq    %rsp, %rbp

    # a is in %edi
    # b is in %esi
    movl    %edi, %eax       # eax = a
    addl    %esi, %eax       # eax = a + b

    popq    %rbp
    ret
✔️ 2. How the Call Works (Step-by-Step Summary)
Caller (main)

Places arguments in registers (%rdi, %rsi, %rdx, %rcx, %r8, %r9).

Executes call add_two_numbers.

call pushes return address onto the stack.

After the function returns, %eax holds the integer result.

Callee (add_two_numbers)

Sets up a stack frame (push %rbp, mov %rsp, %rbp).

Uses the passed-in argument registers.

Places return value in %eax.

Cleans up (pop %rbp, ret).

✔️ 3. Alternative Version: No Stack Frame in Callee
If the function is tiny, you may omit the frame entirely:

add_two_numbers:
    movl    %edi, %eax
    addl    %esi, %eax
    ret
This is fully valid and common for leaf functions.

✔️ 4. Practical Action Plan
If you want, I can also generate:

An annotated diagram of the stack during call

A version aligned for 16-byte stack rules

The same example using Intel syntax

A version that integrates with your CSC 264 course slides

Just tell me which you want next.

You said:
Please provide a version showing 16-byte alignment
ChatGPT said:

Thought for 35s
Here’s a version that explicitly shows 16-byte stack alignment at the call site, using pure x86-64 GNU GAS (AT&T syntax) with _start as the entry point.

1. Direct Answer – Aligned Call Example
    .section .text
    .globl  _start

_start:
    # On entry to _start (Linux x86-64), %rsp is typically 16n+8.
    # We want %rsp to be 16-byte aligned *before* any call instructions.
    #
    # A simple way: subtract 8 → (16n+8) - 8 = 16n.
    subq    $8, %rsp          # Now %rsp is 16-byte aligned.

    # --- Set up arguments for add_two_numbers(int a, int b) ---
    # System V AMD64 ABI:
    #   1st integer arg → %rdi
    #   2nd integer arg → %rsi
    movl    $40, %edi         # a = 40
    movl    $2,  %esi         # b = 2

    # At this point %rsp is a multiple of 16, so this call is aligned.
    call    add_two_numbers   # result in %eax

    # Use result as process exit code
    movl    %eax, %edi        # exit code = result
    movl    $60, %eax         # syscall: exit
    syscall                   # exit(result)


    .globl  add_two_numbers
add_two_numbers:
    # Standard function prologue
    pushq   %rbp              # %rsp -= 8  (still 16-byte aligned inside body)
    movq    %rsp, %rbp

    # a is in %edi, b is in %esi
    movl    %edi, %eax        # eax = a
    addl    %esi, %eax        # eax = a + b

    # Standard epilogue
    popq    %rbp
    ret
You can assemble and link this with:

as -o aligned.o aligned.s
ld -o aligned aligned.o
./aligned
echo $?
You should see 42 as the exit status.

2. Step-by-Step Reasoning (Why This Is Aligned)
At _start
On Linux x86-64, when your program begins at _start, the kernel sets %rsp to a value that is typically 16n + 8.

The System V AMD64 ABI requires:

%rsp must be 16-byte aligned before a call instruction.

So we do:

subq $8, %rsp
If %rsp was 16n + 8, then after this it is 16n → now a multiple of 16.

At the call instruction
Right before call add_two_numbers, %rsp is a multiple of 16 (aligned).

The call instruction pushes an 8-byte return address:

rsp_before_call  = 16n
call             → pushes 8 bytes
rsp_in_callee    = rsp_before_call - 8 = 16n - 8 = 16n - 8
Inside add_two_numbers
First instruction in the callee:

pushq %rbp       # rsp = rsp_in_callee - 8
So:

rsp_after_push = (16n - 8) - 8 = 16n - 16 = 16(n - 1)
That is again a multiple of 16 → inside the function body, %rsp is 16-byte aligned, which is what the ABI expects for local stack usage and SSE spills.

3. Alternative Perspective / Variants
a) Using andq to Align Arbitrarily
If you don’t want to assume %rsp starts at 16n + 8, you can “round down” to the nearest 16-byte boundary:

    andq    $-16, %rsp    # Clears low 4 bits, rsp = floor(rsp / 16) * 16
This guarantees 16-byte alignment, regardless of the initial value. For simple demo programs that don’t need argc/argv, this is fine; in a real runtime, you’d save them before clobbering %rsp.

b) C-style main instead of _start
If you write:

    .globl main
main:
    pushq   %rbp
    movq    %rsp, %rbp
    ...
    call    add_two_numbers
and link with gcc, the C runtime arranges things so that inside main, after the standard prologue, %rsp is 16-byte aligned, and your call is already safe as long as you only subtract stack space in multiples of 16.

4. Practical Action Plan
If you’re wiring this into your teaching or experimenting:

Use _start version above to show the raw alignment math and syscalls.

Then show the main+CRT version to explain how C runtimes hide those details.

Have students:

Add a local stack allocation (e.g. subq $16, %rsp) and see how misaligned vs aligned amounts affect correctness.

Inspect %rsp in gdb before/after call and push %rbp.

If you’d like, I can next:

Draw a little stack diagram of %rsp values at each step, or

Convert this to Intel syntax while keeping the alignment logic identical.



No file chosenNo file chosen
ChatGPT can make mistakes. Check important info.

