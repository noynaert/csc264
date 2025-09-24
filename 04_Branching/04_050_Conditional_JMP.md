# 04.050 Conditional `jmp`

## `jz`

The love child of the `jmp` instruction and the `zf` flag is the `jz` command.

The jz command jumps, but only if the ZF is set (1).  In other words, the jump happens if and only if the ZF is set.

## `jnz` 

The `jnz` command is the twin of the `jz`.  However it jumps when the ZF is unset.

## Other flags have their own jump commands

Many of the flags have jump conditions.  For example, the Carry Flag (CF) has the `jc` and `jnc` commands.

## Loop with the JNZ

We can use the jump and jz flags to create loops.

I want to keep this as simple as possible, so we will count down to 0 instead of counting upward as you usually do in introductory programming courses

``` # Load the exponent as the loop controller
  movq exp, %rcx   # move the value stored in num1 into the rax register

  # Load the accumulator with 1.
  movq $1, %rax

  # base is the multiplier. stash it in r8
  movq base, %r8
   
_top:
  mulq %r8
  decq %rcx
  jnz  _top

  movq %rax, result
  ```