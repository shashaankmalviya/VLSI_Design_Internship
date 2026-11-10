`timescale 1ns/1ps
module tb_bcd_to_excess3;
    reg [3:0] BCD;
    wire [3:0] EXCESS3;
    bcd_to_excess3 DUT(.BCD(BCD), .EXCESS3(EXCESS3));
    initial begin
        BCD=4'b0000; #10; BCD=4'b0001; #10;
        BCD=4'b0010; #10; BCD=4'b0011; #10;
        BCD=4'b0100; #10; BCD=4'b0101; #10;
        BCD=4'b0110; #10; BCD=4'b0111; #10;
        BCD=4'b1000; #10; BCD=4'b1001; #10;
        $finish;
    end
endmodule
