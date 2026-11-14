# Assignment 4: Up/Down Counters

This assignment demonstrates 4-bit counters with selectable counting direction and compares asynchronous and synchronous reset behavior.

## Contents

- **Q1:** `counter_async` resets immediately when `reset` is asserted and counts on the rising edge of `clk`.
- **Q1:** `counter_sync` samples `reset` on the rising edge of `clk`.

When `UP` is high the counter increments; when it is low the counter decrements. RTL is in `Q1/src/`, and the counter testbench is in `Q1/tb/`.
