`timescale 1ns/1ps
module tb_binary_to_gray;
reg [2:0] B;
wire [2:0] G;

binary_to_gray DUT (
   .B(B),
   .G(G)
);
initial begin
   B = 3'b000; #10;
   B = 3'b001; #10;
   B = 3'b010; #10;
   B = 3'b011; #10;
   B = 3'b100; #10;
   B = 3'b101; #10;
   B = 3'b110; #10;
   B = 3'b111; #10;
   $finish;
end
endmodule
