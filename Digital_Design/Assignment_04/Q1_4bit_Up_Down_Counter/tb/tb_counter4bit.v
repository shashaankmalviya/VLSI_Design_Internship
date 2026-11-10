`timescale 1ns/1ps
module tb_counter4bit;
    reg clk, reset, UP;
    wire [3:0] Q_sync, Q_async;
    counter_sync U1(.clk(clk), .reset(reset), .UP(UP), .Q(Q_sync));
    counter_async U2(.clk(clk), .reset(reset), .UP(UP), .Q(Q_async));

    initial begin clk=0; forever #5 clk=~clk; end
    initial begin
        reset=1; UP=1;
        #12; reset=0;
        UP=1; #50;
        UP=0; #50;
        reset=1; #10; reset=0;
        UP=0; #20;
        #2; reset=1; #3; reset=0;
        UP=1; #30;
        $finish;
    end
endmodule
