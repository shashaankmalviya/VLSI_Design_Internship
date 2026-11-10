`timescale 1ns/1ps
module tb_mux2to1;
    reg A, B, sel;
    wire Y;
    mux2to1 DUT(.A(A), .B(B), .sel(sel), .Y(Y));
    initial begin
        $display("Time\t A B sel | Y");
        $monitor("%0t\t %b %b %b | %b", $time, A, B, sel, Y);
        A=0; B=0; sel=0; #10;
        A=0; B=1; sel=0; #10;
        A=1; B=0; sel=0; #10;
        A=1; B=1; sel=0; #10;
        A=0; B=0; sel=1; #10;
        A=0; B=1; sel=1; #10;
        A=1; B=0; sel=1; #10;
        A=1; B=1; sel=1; #10;
        $finish;
    end
endmodule
