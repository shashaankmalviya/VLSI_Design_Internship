`timescale 1ns/1ps
module tb_mealy_1001;
    reg clk, reset, x;
    wire z;
    mealy_1001 DUT(.clk(clk), .reset(reset), .x(x), .z(z));
    initial begin clk=0; forever #5 clk=~clk; end
    initial begin
        $monitor("Time=%0t | reset=%b | x=%b | z=%b", $time, reset, x, z);
        reset=1; x=0; #12 reset=0;
        // Apply 1001 followed by additional inputs.
        @(negedge clk) x=1; @(negedge clk) x=0;
        @(negedge clk) x=0; @(negedge clk) x=1;
        @(negedge clk) x=0; @(negedge clk) x=1;
        @(negedge clk) x=0;
        // Overlapping-sequence stimulus 1001001
        @(negedge clk) x=0; @(negedge clk) x=1;
        #10; $finish;
    end
endmodule

module tb_moore_1001;
    reg clk, reset, x;
    wire z;
    moore_1001 DUT(.clk(clk), .reset(reset), .x(x), .z(z));
    initial begin clk=0; forever #5 clk=~clk; end
    initial begin
        $monitor("Time=%0t | reset=%b | x=%b | z=%b", $time, reset, x, z);
        reset=1; x=0; #12 reset=0;
        // First 1001 sequence
        @(negedge clk) x=1; @(negedge clk) x=0;
        @(negedge clk) x=0; @(negedge clk) x=1;
        // Additional inputs and another 1001 sequence
        @(negedge clk) x=0; @(negedge clk) x=1;
        @(negedge clk) x=0; @(negedge clk) x=1;
        @(negedge clk) x=0; @(negedge clk) x=0;
        @(negedge clk) x=1;
        #10; $finish;
    end
endmodule
