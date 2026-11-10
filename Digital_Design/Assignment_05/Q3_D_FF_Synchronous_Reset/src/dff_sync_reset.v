`timescale 1ns/1ps
module dff_sync_reset(input clk, reset, D, output reg Q);
    always @(posedge clk) begin
        if (reset) Q <= 1'b0;
        else Q <= D;
    end
endmodule
