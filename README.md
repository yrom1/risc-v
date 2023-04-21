# risc-v

https://www.cs.cornell.edu/courses/cs3410/2019sp/riscv/interpreter/#
https://www.cs.cornell.edu/courses/cs3410/2019sp/schedule/

---

## Arithmetics:
- `ADD`: Add two registers and store the result in a destination register. Syntax: `ADD rd, rs1, rs2`
- `ADDI`: Add a register and an immediate value and store the result in a destination register. Syntax: `ADDI rd, rs1, imm`
- `SUB`: Subtract the value in the second source register from the first source register and store the result in a destination register. Syntax: `SUB rd, rs1, rs2`

## Logical:
- `AND`: Perform bitwise AND on two registers and store the result in a destination register. Syntax: `AND rd, rs1, rs2`
- `ANDI`: Perform bitwise AND on a register and an immediate value and store the result in a destination register. Syntax: `ANDI rd, rs1, imm`
- `OR`: Perform bitwise OR on two registers and store the result in a destination register. Syntax: `OR rd, rs1, rs2`
- `ORI`: Perform bitwise OR on a register and an immediate value and store the result in a destination register. Syntax: `ORI rd, rs1, imm`
- `XOR`: Perform bitwise XOR on two registers and store the result in a destination register. Syntax: `XOR rd, rs1, rs2`
- `XORI`: Perform bitwise XOR on a register and an immediate value and store the result in a destination register. Syntax: `XORI rd, rs1, imm`

## Sets:
- `SLT`: Set if less than. Set the destination register to 1 if the first source register is less than the second source register, otherwise 0. Syntax: `SLT rd, rs1, rs2`
- `SLTI`: Set if less than immediate. Set the destination register to 1 if the source register is less than the immediate value, otherwise 0. Syntax: `SLTI rd, rs1, imm`
- `SLTU`: Set if less than unsigned. Set the destination register to 1 if the first source register is less than the second source register, treating them as unsigned integers, otherwise 0. Syntax: `SLTU rd, rs1, rs2`
- `SLTIU`: Set if less than immediate unsigned. Set the destination register to 1 if the source register is less than the immediate value, treating them as unsigned integers, otherwise 0. Syntax: `SLTIU rd, rs1, imm`

## Shifts:
- `SRA`: Shift right arithmetic. Shift the value in the first source register right by the amount specified in the second source register, sign-extending the result, and store the result in a destination register. Syntax: `SRA rd, rs1, rs2`
- `SRAI`: Shift right arithmetic immediate. Shift the value in the source register right by the specified immediate value, sign-extending the result, and store the result in a destination register. Syntax: `SRAI rd, rs1, imm`
- `SRL`: Shift right logical. Shift the value in the first source register right by the amount specified in the second source register, zero-extending the result, and store the result in a destination register. Syntax: `SRL rd, rs1, rs2`
- `SRLI`: Shift right logical immediate. Shift the value in the source register right by the specified immediate value, zero-extending the result, and store the result in a destination register. Syntax: `SRLI rd, rs1, imm`
- `SLL`: Shift left logical. Shift the value in the first source register left by the amount specified in the second source register, and store the result in a destination register. Syntax: `SLL rd, rs1, rs2`
- `SLLI`: Shift left logical immediate. Shift the value in the source register left by the specified immediate value, and store the result in a destination register. Syntax: `SLLI rd, rs1, imm`

## Memory:
- `LW`: Load word. Load a 32-bit word from memory into a destination register. Syntax: `LW rd, offset(rs1)`
- `SW`: Store word. Store a 32-bit word from a source register to memory. Syntax: `SW rs2, offset(rs1)`
- `LB`: Load byte. Load a byte from memory into a destination register, sign-extending the result. Syntax: `LB rd, offset(rs1)`
- `SB`: Store byte. Store a byte from a source register to memory. Syntax: `SB rs2, offset(rs1)`

## PC:
- `LUI`: Load upper immediate. Load a 20-bit immediate value into the upper 20 bits of a destination register, filling the lower 12 bits with zeros. Syntax: `LUI rd, imm`
- `AUIPC`: Add upper immediate to PC. Add a 20-bit immediate value to the program counter, and store the result in a destination register. Syntax: `AUIPC rd, imm`

## Jumps:
- `JAL`: Jump and link. Jump to a target address and store the address of the next instruction in a destination register. Syntax: `JAL rd, offset`
- `JALR`: Jump and link register. Jump to a target address stored in a register and store the address of the next instruction in a destination register. Syntax: `JALR rd, rs1, offset`

## Branches:
- `BEQ`: Branch if equal. Branch to a target address if the values in the two source registers are equal. Syntax: `BEQ rs1, rs2, offset`
- `BNE`: Branch if not equal. Branch to a target address if the values in the two source registers are not equal. Syntax: `BNE rs1, rs2, offset`
- `BLT`: Branch if less than. Branch to a target address if the value in the first source register is less than the value in the second source register. Syntax: `BLT rs1, rs2, offset`
- `BGE`: Branch if greater than or equal. Branch to a target address if the value in the first source register is greater than or equal to the value in the second source register. Syntax: `BGE rs1, rs2, offset`
- `BLTU`: Branch if less than unsigned. Branch to a target address if the value in the first source register is less than the value in the second source register, treating them as unsigned integers. Syntax: `BLTU rs1, rs2, offset`
- `BGEU`: Branch if greater than or equal unsigned. Branch to a target address if the value in the first source register is greater than or equal to the value in the second source register, treating them as unsigned integers. Syntax: `BGEU rs1, rs2, offset`

---

In the RISC-V assembly code, the variables a, b, and sum are represented using registers and memory locations on the stack. Here's the corresponding section of the RISC-V assembly code with comments to explain the relevant parts:

```assembly
	li	a5,5          ; Load the immediate value 5 into register a5 (corresponds to int a = 5)
	sw	a5,-20(s0)    ; Store the value in register a5 into the memory location -20(s0) (s0 is the stack pointer)

	li	a5,7          ; Load the immediate value 7 into register a5 (corresponds to int b = 7)
	sw	a5,-24(s0)    ; Store the value in register a5 into the memory location -24(s0)

	lw	a5,-20(s0)    ; Load the value from memory location -20(s0) (int a) into register a5
	mv	a4,a5         ; Move the value from register a5 to register a4
	lw	a5,-24(s0)    ; Load the value from memory location -24(s0) (int b) into register a5
	addw	a5,a4,a5    ; Add the values in registers a4 and a5, and store the result in register a5 (corresponds to int sum = a + b)
	sw	a5,-28(s0)    ; Store the value in register a5 (sum) into the memory location -28(s0)
```

The code uses the RISC-V registers a4 and a5 to perform the addition operation. The values of the variables a, b, and sum are stored in memory locations relative to the stack pointer s0:

```
a: -20(s0)
b: -24(s0)
sum: -28(s0)
```

The assembly code first loads the values of a and b (5 and 7, respectively) into register a5 and stores them in the appropriate memory locations. Then, it loads the values of a and b from memory into registers a4 and a5, respectively, and performs the addition. Finally, it stores the result (the sum) in the designated memory location for the variable sum.
