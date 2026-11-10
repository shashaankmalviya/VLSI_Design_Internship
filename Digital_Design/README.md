# Digital Design

Verilog HDL assignments extracted and organized from the supplied *Digital Assignments.pdf*.

## Organization

Each assignment has its own folder. Each question contains only two code folders:
- `src/` — Verilog RTL/design source.
- `tb/` — Verilog testbench.

## Assignments

| Assignment | Main topics |
|---|---|
| 01 | Logic gates and 2:1 multiplexer |
| 02 | Encoder, magnitude comparator, Binary-to-Gray converter |
| 03 | BCD-to-Excess-3 and seven-segment decoder |
| 04 | 4-bit synchronous/asynchronous up/down counter |
| 05 | Testbench design: mux, self-checking comparator, D flip-flop, counter |
| 06 | Mealy and Moore sequence detector for 1001 |
| 07 | Universal shift register and 8-bit ALU simulation using VCS |
| 08 | Coverage analysis for universal shift register and ALU |
| 09 | Synthesis exercises: universal shift register, ALU, and 10110 sequence detector |

## Conventions

- Verilog source and testbench files begin with `` `timescale 1ns/1ps ``.
- RTL and testbench files are separated into `src/` and `tb/`.
- Reused RTL is copied into later assignment folders when the question depends on a design introduced earlier.

## Extraction notes

The code is transcribed from the supplied master PDF. A few questions refer to RTL from earlier assignments rather than repeating it; those RTL files are included in the relevant later question folders. Assignment 5, Q4 references an `up_down_counter` module, but the PDF does not provide a matching module definition. This is explicitly documented rather than silently inventing a replacement. Simulation screenshots, VCD files, synthesis reports, and tool-generated outputs are not included because the requested archive is organized around source and testbench code.
