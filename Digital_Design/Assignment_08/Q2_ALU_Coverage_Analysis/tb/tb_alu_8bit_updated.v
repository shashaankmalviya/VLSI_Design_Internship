`timescale 1ns/1ps
module tb_alu_8bit_updated;

  reg [7:0] A, B;
  reg [2:0] opcode;
  wire [7:0] result;

  alu_8bit uut (
     .A(A),
     .B(B),
     .opcode(opcode),
     .result(result)
  );
  initial begin
     $dumpfile("../VCD/alu_8bit_updated.vcd");
     $dumpvars(0, tb_alu_8bit_updated);

    // Addition:
    A = 8'd20; B = 8'd10; opcode = 3'b000;
    #10;
    // Addition: (8-bit result wraps to 0)
    A = 8'hFF; B = 8'h01; opcode = 3'b000;
    #10;
    // Subtraction:
    A = 8'd20; B = 8'd10; opcode = 3'b001;
    #10;
    // Subtraction: (8-bit underflow)
    A = 8'd5; B = 8'd10; opcode = 3'b001;
    #10;
    // AND
    A = 8'hF0; B = 8'h0F; opcode = 3'b010;
    #10;
    // OR
    A = 8'hF0; B = 8'h0F; opcode = 3'b011;
    #10;
    // XOR
    A = 8'hAA; B = 8'hFF; opcode = 3'b100;
    #10;
    // Left shift by 2
     A = 8'h0F; B = 8'd2; opcode = 3'b101;
     #10;

     // Left shift by 0
     A = 8'hA5; B = 8'd0; opcode = 3'b101;
     #10;

     // Right shift by 2
     A = 8'hF0; B = 8'd2; opcode = 3'b110;
     #10;

     // Right shift by 0
     A = 8'hA5; B = 8'd0; opcode = 3'b110;
     #10;

     // Default opcode
     A = 8'hFF; B = 8'hFF; opcode = 3'b111;
     #10;

    $finish;
  end

  initial begin
     $monitor("Time=%0t A=%h B=%h opcode=%b result=%h",
            $time, A, B, opcode, result);
  end

endmodule
