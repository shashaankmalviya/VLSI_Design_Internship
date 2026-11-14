# Assignment 8: Enhanced Shift Register and ALU

This assignment extends the previous datapath exercises with a universal shift register and an ALU that exposes additional status information.

## Contents

- **Q1:** A 4-bit universal shift register with hold, shift-right, shift-left, and parallel-load modes selected by `mode`.
- **Q2:** An 8-bit ALU with addition and carry output, subtraction, bitwise AND/OR/XOR, NOR, set-less-than, and left-shift operations. The result also drives a zero flag.

RTL is stored in `src/`; Q2 includes both an initial and an updated testbench under `tb/`.
