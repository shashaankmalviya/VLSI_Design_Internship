`timescale 1ns/1ps
module tb_seq_det;
    reg clk, rst, din;
    wire detected;
    seq_det uut(.clk(clk), .rst(rst), .din(din), .detected(detected));
    always #5 clk = ~clk;

    task send_bit;
        input bit_value;
        begin
            @(negedge clk);
            din = bit_value;
            #1;
            $display("Time=%0t din=%b detected=%b", $time, din, detected);
        end
    endtask

    initial begin
        $dumpfile("../VCD/seq_det.vcd");
        $dumpvars(0, tb_seq_det);
        clk=0; rst=1; din=0; #12; rst=0;
        // Input stream from the master PDF: 10110110, then additional bits.
        send_bit(1); send_bit(0); send_bit(1); send_bit(1);
        send_bit(0); send_bit(1); send_bit(1); send_bit(0);
        send_bit(0); send_bit(1); send_bit(0);
        repeat (2) @(negedge clk);
        $finish;
    end
endmodule
