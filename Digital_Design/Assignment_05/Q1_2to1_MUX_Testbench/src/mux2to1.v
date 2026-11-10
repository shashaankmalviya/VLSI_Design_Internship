`timescale 1ns/1ps
module mux2to1(input A, B, sel, output Y);
    assign Y = sel ? B : A;
endmodule
