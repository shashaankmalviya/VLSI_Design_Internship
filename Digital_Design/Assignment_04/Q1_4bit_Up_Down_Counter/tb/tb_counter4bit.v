`timescale 1ns/1ps
module tb_counter4bit;
reg clk, reset, UP;

wire [3:0] Q_sync;
wire [3:0] Q_async;

// Synchronous reset counter
counter_sync U1 (
   .clk(clk),
   .reset(reset),
   .UP(UP),
   .Q(Q_sync)
);
// Asynchronous reset counter
counter_async U2 (
   .clk(clk),
   .reset(reset),
   .UP(UP),
   .Q(Q_async)
);
// Generating 10 ns clock period
initial begin
   clk = 0;
   forever #5 clk = ~clk;
end

initial begin
   // Initializing signals
   reset = 1;
   UP = 1;
   // Reset both counters
   #12;
   reset = 0;
   // Verifying up-counting
   UP = 1;
   #50;
   // Verifying down-counting
   UP = 0;
   #50;
 // Synchronous reset while clock is running
 reset = 1;
 #10;
 reset = 0;
 // Count down from zero to verify underflow
 UP = 0;
 #20;
 // Testing asynchronous reset between clock edges
 #2;
 reset = 1;
 #3;
 reset = 0;
 // Continue counting up
 UP = 1;
 #30;
 $finish;
end
endmodule
