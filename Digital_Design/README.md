
# Digital Design

This folder contains Verilog RTL implementations, testbenches, and simulation work completed during the digital-design portion of the **Internship on VLSI Design Covering Analog and Digital Design Flow**, organized by NIT and NIELIT Calicut.

The assignments cover combinational and sequential logic, finite-state machines, arithmetic circuits, and integrated digital systems. The folder also includes an automatic railway level crossing controller mini project.

## Contents

| Folder | Topics Covered |
|---|---|
| [Assignment 01](Assignment_01/) | Basic logic gates and 2-to-1 multiplexers using different Verilog modeling styles |
| [Assignment 02](Assignment_02/) | Binary encoder, magnitude comparator, and binary-to-Gray-code converter |
| [Assignment 03](Assignment_03/) | BCD-to-Excess-3 conversion and seven-segment display decoding |
| [Assignment 04](Assignment_04/) | 4-bit up/down counters with synchronous and asynchronous reset |
| [Assignment 05](Assignment_05/) | Multiplexer, comparator, D flip-flop, and asynchronous-reset counter |
| [Assignment 06](Assignment_06/) | Mealy and Moore FSM sequence detectors for `1001` |
| [Assignment 07](Assignment_07/) | Universal shift register and 8-bit Arithmetic Logic Unit (ALU) |
| [Assignment 08](Assignment_08/) | Enhanced shift-register and ALU designs with status outputs |
| [Assignment 09](Assignment_09/) | Integrated shift register, ALU, and `10110` sequence detector |
| [Mini Project – Railway Level Crossing Controller](Mini_Project_Railway/) | FSM-based railway crossing control with gate operation, road signals, warning alarm, and train sensors |

## Assignment Structure

Each assignment is organized question-wise. Every question contains two subfolders:

```text
Assignment_01/
├── Q1/
│   ├── src/   # Verilog design modules
│   └── tb/    # Testbench files
│
├── Q2/
│   ├── src/
│   └── tb/
│
└── README.md
```

The same organization is followed for the remaining assignments. Source files and testbenches are kept separately for easier navigation and verification.

## Mini Project

The `Mini_Project_Railway` folder contains the **Automatic Railway Level Crossing Controller**, implemented using Verilog HDL.

The project includes:

- FSM-based controller design
- RTL implementation
- Testbench and functional simulation
- Verification and coverage analysis
- Logic synthesis

The project folder contains the source code, testbench, complete project report PDF, and its own README.

## Skills Practiced

- Combinational and sequential circuit design
- Dataflow, structural, and behavioral Verilog modeling
- Synchronous and asynchronous reset handling
- Counters, registers, multiplexers, comparators, and ALUs
- Mealy and Moore finite-state-machine design
- Sequence detector implementation
- Testbench development and functional verification
- Simulation and waveform analysis
- Code coverage and logic synthesis

## Tools and Technologies

| Tool / Technology | Application |
|---|---|
| Verilog HDL | RTL design and implementation |
| Synopsys VCS | Functional simulation and verification |
| GTKWave | Waveform analysis |
| Synopsys Design Compiler | Logic synthesis |

## Running Simulations

The Verilog designs and testbenches can be simulated using Synopsys VCS.

From the relevant question directory containing `src/` and `tb/`, compile the design and testbench using:

```bash
vcs -full64 -sverilog -debug_access+all src/<design>.v tb/<testbench>.v -o simv
```

Run the simulation:

```bash
./simv
```

Refer to the individual assignment README files for the corresponding design and testbench filenames.

---

**Internship:** VLSI Design Covering Analog and Digital Design Flow  
**Organized by:** NIT and NIELIT Calicut
