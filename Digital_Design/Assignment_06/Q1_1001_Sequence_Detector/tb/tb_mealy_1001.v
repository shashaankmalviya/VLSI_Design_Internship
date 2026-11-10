`timescale 1ns/1ps
module tb_mealy_1001;

reg clk;
reg reset;
reg x;
wire z;

mealy_1001 DUT (
   .clk(clk),
   .reset(reset),
   .x(x),
   .z(z)
);

// Clock generation: 10 ns period
initial begin
   clk = 0;
   forever #5 clk = ~clk;
end

// Applying input sequence
initial begin
   $monitor("Time=%0t | reset=%b | x=%b | z=%b",
          $time, reset, x, z);

  reset = 1;
  x = 0;
  #12 reset = 0;

  // Sending 1001:
  @(negedge clk) x = 1;
  @(negedge clk) x = 0;
  @(negedge clk) x = 0;
  @(negedge clk) x = 1;

  // Additional inputs
  @(negedge clk) x = 0;
  @(negedge clk) x = 1;
  @(negedge clk) x = 0;

// Testing overlapping sequence:
// 1001001

  @(negedge clk) x = 0;
  @(negedge clk) x = 1;
  @(negedge clk) x = 0;

  #10;
  $finish;
end

endmodule
