`timescale 1ns/1ps
module tb_railway;

  reg clk, rst;
  reg train_approach, train_departed;
  reg gate_open, gate_closed;

  wire gate_open_cmd, gate_close_cmd;
  wire warning, road_red, road_green;

  railway_controller #(.WARN_CYCLES(3)) uut (
     .clk(clk),
     .rst(rst),
     .train_approach(train_approach),
     .train_departed(train_departed),
     .gate_open(gate_open),
     .gate_closed(gate_closed),
     .gate_open_cmd(gate_open_cmd),
     .gate_close_cmd(gate_close_cmd),
     .warning(warning),
     .road_red(road_red),
     .road_green(road_green)
  );

  // 10 ns clock period
  always #5 clk = ~clk;
  initial begin
     $dumpfile("../VCD/railway_controller.vcd");
     $dumpvars(0, tb_railway);

    // Initial values
    clk = 0;
    rst = 1;
    train_approach = 0;
    train_departed = 0;
    gate_open = 1;
    gate_closed = 0;
    // Reset
    #12;
    rst = 0;

    // Test 1: Train approaches
    @(negedge clk);
    train_approach = 1;
    @(negedge clk);
    train_approach = 0;

   // Test 2: Warning interval
    repeat (5) @(negedge clk);

    // Test 3: Gate fully closes
    gate_open = 0;
    gate_closed = 1;

    // Test 4: Train passes
    repeat (2) @(negedge clk);

    // Test 5: Train departs
    train_departed = 1;

    @(negedge clk);
    train_departed = 0;

    // Gate begins opening
    gate_closed = 0;
    gate_open = 0;

    // Test 6: Gate fully opens
    repeat (2) @(negedge clk);
    gate_open = 1;

    // Return to IDLE
    repeat (2) @(negedge clk);

    // Test 7: Invalid sensor combination
    gate_closed = 1;

    repeat (3) @(negedge clk);

    $finish;
  end

endmodule
