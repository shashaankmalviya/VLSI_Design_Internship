module gates_dataflow (
   input A,
   input B,
   output Y_AND,
   output Y_OR,
   output Y_NOT,
   output Y_NAND,
   output Y_NOR,
   output Y_XOR,
   output Y_XNOR
);
assign Y_AND = A & B;
assign Y_OR = A | B;
assign Y_NOT = ~A;
assign Y_NAND = ~(A & B);
assign Y_NOR = ~(A | B);
assign Y_XOR = A ^ B;
assign Y_XNOR = ~(A ^ B);

endmodule

module gates_structural (
   input A,
   input B,
   output Y_AND,
   output Y_OR,
   output Y_NOT,
   output Y_NAND,
   output Y_NOR,
   output Y_XOR,
   output Y_XNOR
);
and (Y_AND, A, B);
or (Y_OR, A, B);
not (Y_NOT, A);
nand (Y_NAND, A, B);
nor (Y_NOR, A, B);
xor (Y_XOR, A, B);
xnor (Y_XNOR, A, B);

endmodule
