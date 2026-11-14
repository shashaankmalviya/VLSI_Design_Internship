# Assignment 6: Sequence Detector FSMs

This assignment implements finite-state machines that detect the serial bit pattern `1001`.

## Contents

- **Mealy detector:** asserts the output on the transition that receives the final matching bit.
- **Moore detector:** asserts the output from a dedicated state after the complete pattern is received.

Both detectors use a clock, an active-high asynchronous reset, and serial input `x`. The implementations are in `Q1/src/`, with a shared testbench in `Q1/tb/`.
