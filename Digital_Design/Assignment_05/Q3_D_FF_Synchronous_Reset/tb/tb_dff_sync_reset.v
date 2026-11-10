`timescale 1ns/1ps
module tb_dff_sync_reset;

reg clk;
reg reset;
reg D;
wire Q;
// Instantiating the design
dff_sync_reset DUT (
   .clk(clk),
   .reset(reset),
   .D(D),
   .Q(Q)
);
// Generating 10 ns clock
initial begin
   clk = 0;
   forever #5 clk = ~clk;
end
// Applying reset and input stimuli
initial begin
   $dumpfile("dff_sync_reset.vcd");
   $dumpvars(0, tb_dff_sync_reset);

  $monitor("Time=%0t | clk=%b reset=%b D=%b Q=%b",$time, clk, reset, D, Q);

  reset = 1;
  D = 0;
  // Reset remains active for first two clock cycles
  #20 reset = 0;

  // Applying different D values
  #2 D = 1;
  #10 D = 0;
  #10 D = 1;
  #10 D = 1;
  #10 D = 0;
  #10 D = 1;

  #10 $finish;
end
endmodule
