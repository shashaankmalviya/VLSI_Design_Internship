`timescale 1ns/1ps
module universal_shift_register(
    input wire clk, rst,
    input wire [1:0] mode,
    input wire [3:0] parallel_in,
    input wire serial_in_left, serial_in_right,
    output reg [3:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst) q <= 4'b0000;
        else begin
            case (mode)
                2'b00: q <= q; // Hold
                2'b01: q <= {serial_in_left, q[3:1]}; // Shift right
                2'b10: q <= {q[2:0], serial_in_right}; // Shift left
                2'b11: q <= parallel_in; // Parallel load
                default: q <= q;
            endcase
        end
    end
endmodule
