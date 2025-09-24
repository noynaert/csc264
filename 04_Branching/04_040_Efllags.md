# 04.040 The `eflags` Register

The `eflags` register contains flags that are set after arithmetic and logical operations.  "Set" means the flag has a value of 1.  "Unset" means the value is 0.

movq does not change the flags.

## Zero Flag

The zero flag is bit 6, but in practice no one cares where it is.

The flag is called the ZF.

```

.globl _start

.text
_start:

  # Set up RAX a number.  It does not change eflags
  movq $5, %rax
  movq $0, %rax
  movq $0xabcdef, %rax

  # Any arithmetic will set the Zero Flag
  xor %rax, %rax
  addq $5, %rax
  addq $-5, %rax
```

## The `addq $0` trick

One way to force the flags to be set is to add zero to the target we are testing.  If it is already zero, the ZF will be set.  If it is not zero, the ZF will not be set.

```
  movq $99,%rax
  addq $0, %rax    #ZF is not set

  movq $0, %rax
  addq $0, %rax    #ZF is set
```