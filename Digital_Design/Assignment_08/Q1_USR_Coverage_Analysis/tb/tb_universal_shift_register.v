`timescale 1ns/1ps
        module tb_universal_shift_register;
           reg clk, rst;
           reg [1:0] mode;
           reg [3:0] parallel_in;
           reg serial_in_left, serial_in_right;
           wire [3:0] q;
           universal_shift_register uut (
              .clk(clk),
              .rst(rst),
              .mode(mode),
              .parallel_in(parallel_in),
              .serial_in_left(serial_in_left),
              .serial_in_right(serial_in_right),
              .q(q)
           );
           always #5 clk = ~clk;
           initial begin
              $dumpfile("universal_shift_register.vcd");
              $dumpvars(0, tb_universal_shift_register);

             clk = 0;
             rst = 1;
             mode = 2'b00;
             parallel_in = 4'b0000;
             serial_in_left = 0;
             serial_in_right = 0;
             #12 rst = 0;
             // Parallel load: Q = 1010
             @(negedge clk);
             mode = 2'b11;
             parallel_in = 4'b1010;

       // Hold
       @(negedge clk);
       mode = 2'b00;

       // Shift right
       @(negedge clk);
       mode = 2'b01;
       serial_in_left = 1;

       // Shift left
       @(negedge clk);
       mode = 2'b10;
       serial_in_right = 1;

       // Load a different value
       @(negedge clk);
       mode = 2'b11;
       parallel_in = 4'b1100;

       // Hold again
       @(negedge clk);
       mode = 2'b00;

      repeat (2) @(negedge clk);
      $finish;
    end

   initial begin
      $monitor("Time=%0t rst=%b mode=%b parallel_in=%b q=%b",
             $time, rst, mode, parallel_in, q);
   end
 endmodule
