module comparator4bit (
   input [3:0] A,
   input [3:0] B,
   output A_GT_B,
   output A_EQ_B,
   output A_LT_B
);

assign A_GT_B = (A > B);
assign A_EQ_B = (A == B);
assign A_LT_B = (A < B);

endmodule
