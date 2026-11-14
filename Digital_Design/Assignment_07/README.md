# Assignment 7: Shift Register and ALU

This assignment combines a sequential universal shift register with an 8-bit combinational arithmetic and logic unit.

## Contents

- **Q1:** A 4-bit universal shift register supporting hold, shift right, shift left, and parallel load operations. Reset is asynchronous and active-high.
- **Q2:** An 8-bit ALU supporting addition, subtraction, AND, OR, XOR, left shift, and right shift. The ALU also generates a zero flag.

The operation selected by `select` or `alu_control` is described by the RTL in each `src/` directory. Testbenches are provided in the matching `tb/` directories.
