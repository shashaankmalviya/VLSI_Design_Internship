`timescale 1ns/1ps
module tb_up_down_counter;
    reg clk, reset, up_down;
    wire [3:0] count;
    // The master PDF references an up_down_counter module.
    up_down_counter DUT(.clk(clk), .reset(reset), .up_down(up_down), .count(count));

    initial begin clk=0; forever #5 clk=~clk; end
    initial begin
        $display("Time\tReset\tDirection\tCount");
        $monitor("%0t\t%b\t%b\t\t%0d", $time, reset, up_down, count);
        reset=1; up_down=1;
        #12 reset=0;
        repeat (15) @(posedge clk);
        #1 up_down=0;
        repeat (15) @(posedge clk);
        #1;
        $display("Simulation completed.");
        $finish;
    end
endmodule
