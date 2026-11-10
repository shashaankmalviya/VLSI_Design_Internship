`timescale 1ns/1ps
module tb_comparator4bit;

reg [3:0] A, B;
wire A_GT_B, A_EQ_B, A_LT_B;

comparator4bit DUT (
   .A(A),
   .B(B),
   .A_GT_B(A_GT_B),
   .A_EQ_B(A_EQ_B),
   .A_LT_B(A_LT_B)
);
initial begin
   A = 4'd0; B = 4'd0; #10;
   A = 4'd10; B = 4'd6; #10;
   A = 4'd4; B = 4'd4; #10;
   A = 4'd3; B = 4'd8; #10;
   A = 4'd15; B = 4'd0; #10;
   A = 4'd0; B = 4'd15; #10;
   A = 4'd9; B = 4'd12; #10;
   A = 4'd7; B = 4'd2; #10;

   $finish;
end
endmodule
