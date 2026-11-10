# Digital Design Assignments

Verilog code and testbenches transcribed from the supplied 74-page `Digital Assignments.pdf`.

Each question is organized using the requested layout:
- `src/` — design source code.
- `tb/` — testbench code.

The source and testbench contents are kept as shown in the master PDF, including comments and original stimulus. No functional rewrites, optimizations, or replacement implementations have been introduced.

## Assignment 6 — FSM sequence detector

The Mealy and Moore implementations are kept as separate source files and separate testbench files within the same question:
- `src/mealy_1001.v`
- `src/moore_1001.v`
- `tb/tb_mealy_1001.v`
- `tb/tb_moore_1001.v`

## Source availability

Assignment 5, Q4 contains a testbench that instantiates `up_down_counter`, but the master PDF does not include the corresponding RTL module definition. The testbench is preserved as supplied; no substitute design has been created.

For Assignments 8 and 9, where the master PDF provides testbenches referring to RTL already introduced earlier, the corresponding original RTL is included in that question's `src/` folder to make the question folder self-contained.
