`timescale 1ns/1ps
module tb_dff_sync_reset;
    reg clk, reset, D;
    wire Q;
    dff_sync_reset DUT(.clk(clk), .reset(reset), .D(D), .Q(Q));
    initial begin clk=0; forever #5 clk=~clk; end
    initial begin
        $dumpfile("dff_sync_reset.vcd");
        $dumpvars(0, tb_dff_sync_reset);
        $monitor("Time=%0t | clk=%b reset=%b D=%b Q=%b", $time, clk, reset, D, Q);
        reset=1; D=0;
        #20 reset=0;
        #2 D=1; #10 D=0; #10 D=1; #10 D=1; #10 D=0; #10 D=1;
        #10 $finish;
    end
endmodule
