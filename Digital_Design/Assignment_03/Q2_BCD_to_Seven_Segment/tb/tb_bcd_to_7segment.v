`timescale 1ns/1ps
module tb_bcd_to_7segment;

reg [3:0] BCD;
wire [6:0] SEG;

bcd_to_7segment DUT (
   .BCD(BCD),
   .SEG(SEG)
);

initial begin
   BCD = 4'd0; #10;
   BCD = 4'd1; #10;
   BCD = 4'd2; #10;
   BCD = 4'd3; #10;
   BCD = 4'd4; #10;
   BCD = 4'd5; #10;
   BCD = 4'd6; #10;
   BCD = 4'd7; #10;
   BCD = 4'd8; #10;
   BCD = 4'd9; #10;

   $finish;
end
endmodule
