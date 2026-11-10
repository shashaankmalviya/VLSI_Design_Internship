`timescale 1ns/1ps
module tb_alu_8bit;
    reg [7:0] A, B;
    reg [2:0] opcode;
    wire [7:0] result;
    alu_8bit uut(.A(A), .B(B), .opcode(opcode), .result(result));
    initial begin
        $dumpfile("../VCD/alu_8bit.vcd");
        $dumpvars(0, tb_alu_8bit);
        A=8'd20; B=8'd10; opcode=3'b000; #10;
        A=8'd20; B=8'd10; opcode=3'b001; #10;
        A=8'hF0; B=8'h0F; opcode=3'b010; #10;
        A=8'hF0; B=8'h0F; opcode=3'b011; #10;
        A=8'hAA; B=8'hFF; opcode=3'b100; #10;
        A=8'h0F; B=8'd2; opcode=3'b101; #10;
        A=8'hF0; B=8'd2; opcode=3'b110; #10;
        $finish;
    end
    initial $monitor("Time=%0t A=%h B=%h opcode=%b result=%h",
                    $time, A, B, opcode, result);
endmodule
