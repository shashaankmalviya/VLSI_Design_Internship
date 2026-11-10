`timescale 1ns/1ps
module comparator4bit(
    input [3:0] A, B,
    output A_GT_B, A_EQ_B, A_LT_B
);
    assign A_GT_B = (A > B);
    assign A_EQ_B = (A == B);
    assign A_LT_B = (A < B);
endmodule
