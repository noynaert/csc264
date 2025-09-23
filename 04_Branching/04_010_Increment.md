# 04.010 Increment and Decrement

This week's material includes the first part of Chapter 5.  It covers sections 5.1 through 5.3. (`inc` and `dec` are from chapter 4)

## `inc`

The `inc` command increments by 1.

The operand may either be a register or a memory location

The `inc` takes suffixes, with `incq` being the most common.


## `dec`

The `dec` command decrements by 1.  It also takes suffixes.

```txt

.data
  num1: .quad 15
  num2: .quad 0x40
.text
_start:

  # Increment a register
  movq num1, %rax   # move the value stored in num1 into the rax register
  incq %rax

  # Increment a memory location
  incq num2
```

