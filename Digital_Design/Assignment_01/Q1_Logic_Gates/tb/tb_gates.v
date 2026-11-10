`timescale 1ns/1ps
module tb_gates;
    reg A, B;
    wire d_and, d_or, d_not, d_nand, d_nor, d_xor, d_xnor;
    wire s_and, s_or, s_not, s_nand, s_nor, s_xor, s_xnor;

    gates_dataflow D1 (
        .A(A), .B(B), .Y_AND(d_and), .Y_OR(d_or), .Y_NOT(d_not),
        .Y_NAND(d_nand), .Y_NOR(d_nor), .Y_XOR(d_xor), .Y_XNOR(d_xnor)
    );
    gates_structural S1 (
        .A(A), .B(B), .Y_AND(s_and), .Y_OR(s_or), .Y_NOT(s_not),
        .Y_NAND(s_nand), .Y_NOR(s_nor), .Y_XOR(s_xor), .Y_XNOR(s_xnor)
    );

    initial begin
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        $finish;
    end
endmodule
