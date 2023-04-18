# risc-v

https://www.cs.cornell.edu/courses/cs3410/2019sp/riscv/interpreter/#
https://www.cs.cornell.edu/courses/cs3410/2019sp/schedule/

---

In the RISC-V assembly code, the variables a, b, and sum are represented using registers and memory locations on the stack. Here's the corresponding section of the RISC-V assembly code with comments to explain the relevant parts:

```assembly
	li	a5,5          ; Load the immediate value 5 into
                    ; register a5 (corresponds to int a = 5)
	sw	a5,-20(s0)    ; Store the value in register a5 into the
                    ; memory location -20(s0) (s0 is the stack pointer)

	li	a5,7          ; Load the immediate value 7 into register a5
                    ; (corresponds to int b = 7)
	sw	a5,-24(s0)    ; Store the value in register a5 into the memory
                    ; location -24(s0)

	lw	a5,-20(s0)    ; Load the value from memory location -20(s0)
                    ; (int a) into register a5
	mv	a4,a5         ; Move the value from register a5 to register a4
	lw	a5,-24(s0)    ; Load the value from memory location -24(s0) (int b)
                    ; into register a5
	addw	a5,a4,a5    ; Add the values in registers a4 and a5, and store the
                    ; result in register a5 (corresponds to int sum = a + b)
	sw	a5,-28(s0)    ; Store the value in register a5 (sum) into the memory
                    ; location -28(s0)
```

The code uses the RISC-V registers a4 and a5 to perform the addition operation. The values of the variables a, b, and sum are stored in memory locations relative to the stack pointer s0:

```
a: -20(s0)
b: -24(s0)
sum: -28(s0)
```

The assembly code first loads the values of a and b (5 and 7, respectively) into register a5 and stores them in the appropriate memory locations. Then, it loads the values of a and b from memory into registers a4 and a5, respectively, and performs the addition. Finally, it stores the result (the sum) in the designated memory location for the variable sum.
