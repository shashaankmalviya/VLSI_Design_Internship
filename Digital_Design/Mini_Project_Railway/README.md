# Automatic Railway Level Crossing Controller

## Overview

The Automatic Railway Level Crossing Controller is an FSM-based digital controller that manages railway crossing operations using train approach, train departure, and gate-position inputs. It generates gate commands, warning indication, and road traffic signals. The design also detects selected invalid sensor combinations and enters a fault state.

The project covers Verilog RTL design, functional simulation, waveform analysis, code coverage, timing constraints, and logic synthesis.

## Objectives

- Design a finite-state-machine-based railway crossing controller.
- Implement the controller using Verilog RTL.
- Coordinate gate commands, warning indication, and road traffic signals.
- Detect selected invalid gate-sensor combinations.
- Verify normal and fault operation using Synopsys VCS and GTKWave.
- Evaluate code coverage using VCS.
- Synthesize the RTL using Synopsys Design Compiler and analyze the generated reports.


## Input and Output Signals

| Signal | Direction | Function |
|---|---|---|
| `clk` | Input | Synchronizes state transitions |
| `rst` | Input | Resets the FSM |
| `train_approach` | Input | Indicates an approaching train |
| `train_departed` | Input | Indicates train departure |
| `gate_open` | Input | Gate-open feedback |
| `gate_closed` | Input | Gate-closed feedback |
| `gate_open_cmd` | Output | Requests gate opening |
| `gate_close_cmd` | Output | Requests gate closing |
| `warning` | Output | Warning indication |
| `road_red` | Output | Stops road traffic |
| `road_green` | Output | Permits road traffic in the normal state |

## FSM Design

The controller uses six states:

| State | Encoding | Description |
|---|---|---|
| `IDLE` | `000` | Normal state, gate open |
| `WARNING_ST` | `001` | Warning interval before closing |
| `CLOSING` | `010` | Gate closing sequence |
| `TRAIN_PASS` | `011` | Train passage |
| `OPENING` | `100` | Gate opening sequence |
| `FAULT` | `101` | Fault state |

After reset, the FSM enters `IDLE`, where the gate-open command is active and road traffic is permitted. When a train approaches, the controller enters `WARNING_ST`, activates the warning indication, and changes the road signal to red.

After the warning counter reaches its configured threshold, the FSM enters `CLOSING`. When gate-closed feedback is received, it moves to `TRAIN_PASS`. When the train-departure input is asserted, the controller enters `OPENING`. Once gate-open feedback is received, it returns to `IDLE`.

The design enters `FAULT` for selected invalid input combinations. In the RTL, this state is retained until reset. The controller requests gate closure and keeps warning and road-red indications active in this state.

## Verification

The testbench generates a 10 ns clock and applies the following scenarios:

1. Reset and initial signal values.
2. Train approach.
3. Warning interval.
4. Gate fully closes.
5. Train passage.
6. Train departure.
7. Gate opening and return to `IDLE`.
8. Invalid gate-sensor combination.

The project uses Synopsys VCS for simulation and GTKWave for waveform analysis. The full simulation commands and project details are available in `Mini_Project_Report.pdf`.

## Coverage Analysis

Coverage is collected using VCS with line, toggle, branch, condition, and FSM metrics.

| Metric | Coverage achieved |
|---|---:|
| Line coverage | 89.32% |
| Toggle coverage | 80.56% |
| Condition coverage | 63.64% |
| Branch coverage | 75.86% |
| FSM coverage | 42.86% |

## Logic Synthesis

The RTL is synthesized using Synopsys Design Compiler with the SAED32 standard-cell library. The synthesis flow applies the SDC timing constraints, checks the design, and runs `compile_ultra`.

The flow generates quality-of-results, area, timing, and power reports, along with a technology-mapped Verilog netlist, output SDC, and DDC backup.

The timing constraints define a 10 ns clock period, 1.0 ns input delays, 1.0 ns output delays, and a false path from the asynchronous reset. The Design Compiler script uses machine-specific paths from the development environment; update those paths before running it on another system.

## Conclusion

The Automatic Railway Level Crossing Controller demonstrates an RTL-to-synthesis workflow for an FSM-based digital control system. The design coordinates train detection, gate operation, warning indication, and road traffic signals, while incorporating a warning counter and fault-detection logic.

Functional verification was performed using Synopsys VCS, and waveforms were analyzed using GTKWave. Coverage analysis evaluated line, toggle, condition, branch, and FSM coverage. The RTL was subsequently synthesized using Synopsys Design Compiler.

## Tools

- Verilog HDL
- Synopsys VCS
- GTKWave
- Synopsys Design Compiler
- SAED32 standard-cell library
