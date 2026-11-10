`timescale 1ns/1ps
// 1. 4-bit Up/Down Counter with Synchronous Reset
module counter_sync (
   input clk,
   input reset,
   input UP,
   output reg [3:0] Q
);
always @(posedge clk) begin
   if (reset)
       Q <= 4'b0000;
   else if (UP)
       Q <= Q + 1'b1;
   else
       Q <= Q - 1'b1;
end
endmodule

// 2. 4-bit Up/Down Counter with Asynchronous Reset
module counter_async (
 input clk,
 input reset,
 input UP,
 output reg [3:0] Q
);
always @(posedge clk or posedge reset) begin
    if (reset)
        Q <= 4'b0000;
    else if (UP)
        Q <= Q + 1'b1;
    else
        Q <= Q - 1'b1;
end
endmodule
