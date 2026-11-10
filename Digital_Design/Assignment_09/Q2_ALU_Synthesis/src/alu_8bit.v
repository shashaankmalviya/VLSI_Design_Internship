module alu_8bit (
   input wire [7:0] A,
   input wire [7:0] B,
   input wire [2:0] opcode,
   output reg [7:0] result
);

   always @(*) begin
     case (opcode)
       3'b000: result = A + B;      // Addition
       3'b001: result = A - B;    // Subtraction
       3'b010: result = A & B;     // Bitwise AND
       3'b011: result = A | B;    // Bitwise OR
       3'b100: result = A ^ B;     // Bitwise XOR
       3'b101: result = A << B[2:0]; // Logical left shift
       3'b110: result = A >> B[2:0]; // Logical right shift
       3'b111: result = 8'b00000000; // Unused opcode
       default: result = 8'b00000000;
     endcase
   end

endmodule
