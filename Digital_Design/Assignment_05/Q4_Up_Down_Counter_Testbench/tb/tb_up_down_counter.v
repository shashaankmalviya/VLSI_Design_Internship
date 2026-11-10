`timescale 1ns/1ps
module tb_up_down_counter;

reg clk;
reg reset;
reg up_down;
wire [3:0] count;
// Instantiating Assignment 04 counter
up_down_counter DUT (
   .clk(clk),
   .reset(reset),
   .up_down(up_down),
   .count(count)
);
// Clock period = 10 ns
initial begin
   clk = 0;
   forever #5 clk = ~clk;
end

initial begin
   $display("Time\tReset\tDirection\tCount");
   $monitor("%0t\t%b\t%b\t\t%0d", $time, reset, up_down, count);
   // Asynchronous reset: initialize counter to zero
   reset = 1;
   up_down = 1; // 1 = UP, 0 = DOWN

  #12 reset = 0;
  // Count UP for 15 clock edges: 0 -> 15
  repeat (15) @(posedge clk);

  // Change direction after reaching 15
  #1 up_down = 0;

  // Count DOWN for 15 clock edges: 15 -> 0
  repeat (15) @(posedge clk);
  #1;
  $display("Simulation completed.");
  $finish;
end
endmodule
