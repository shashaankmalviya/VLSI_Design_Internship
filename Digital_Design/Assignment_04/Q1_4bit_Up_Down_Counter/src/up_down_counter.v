`timescale 1ns/1ps
module counter_sync(input clk, reset, UP, output reg [3:0] Q);
    always @(posedge clk) begin
        if (reset) Q <= 4'b0000;
        else if (UP) Q <= Q + 1'b1;
        else Q <= Q - 1'b1;
    end
endmodule

module counter_async(input clk, reset, UP, output reg [3:0] Q);
    always @(posedge clk or posedge reset) begin
        if (reset) Q <= 4'b0000;
        else if (UP) Q <= Q + 1'b1;
        else Q <= Q - 1'b1;
    end
endmodule
