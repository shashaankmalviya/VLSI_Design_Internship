`timescale 1ns/1ps
module railway_controller #(
   parameter WARN_CYCLES = 3
)(
   input wire clk,
   input wire rst,
   input wire train_approach,
   input wire train_departed,
   input wire gate_open,
   input wire gate_closed,

     output reg gate_open_cmd,
     output reg gate_close_cmd,
     output reg warning,
     output reg road_red,
     output reg road_green
);
     localparam IDLE   = 3'b000,
            WARNING_ST = 3'b001,
            CLOSING = 3'b010,
            TRAIN_PASS = 3'b011,
            OPENING = 3'b100,
            FAULT    = 3'b101;

     reg [2:0] state, next_state;
     reg [7:0] warn_count;

     // State register
     always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
     end

     // Warning timer
     always @(posedge clk or posedge rst) begin
        if (rst)
            warn_count <= 0;
        else if (state != WARNING_ST)
            warn_count <= 0;
        else if (warn_count < WARN_CYCLES)
            warn_count <= warn_count + 1'b1;
     end

// Next-state logic and safety checks
   always @(*) begin
     next_state = state;
     if (gate_open && gate_closed)
         next_state = FAULT;
     else begin
         case (state)
            IDLE: begin
              if (train_departed)
                  next_state = FAULT;
              else if (train_approach)
                  next_state = WARNING_ST;
           end

         WARNING_ST: begin
           if (train_departed || !gate_open)
               next_state = FAULT;
           else if (warn_count >= WARN_CYCLES)
               next_state = CLOSING;
         end

         CLOSING: begin
           if (train_departed)
               next_state = FAULT;
           else if (gate_closed)
               next_state = TRAIN_PASS;
         end

         TRAIN_PASS: begin
           if (gate_open || !gate_closed)
               next_state = FAULT;
           else if (train_departed)
               next_state = OPENING;
         end

         OPENING: begin
           if (train_approach)
               next_state = FAULT;
           else if (gate_open)
               next_state = IDLE;
         end

        FAULT: begin
           next_state = FAULT;
        end
        default: next_state = FAULT;
      endcase
    end
  end

// Output logic:
   always @(*) begin
     gate_open_cmd = 1'b0;
     gate_close_cmd = 1'b1;
     warning      = 1'b1;
     road_red     = 1'b1;
     road_green = 1'b0;

    case (state)

       IDLE: begin
         gate_open_cmd = 1'b1;
         gate_close_cmd = 1'b0;
         warning     = 1'b0;
         road_red    = 1'b0;
         road_green = 1'b1;
       end

       WARNING_ST: begin
         gate_open_cmd = 1'b1;
         gate_close_cmd = 1'b0;
       end

       CLOSING, TRAIN_PASS, FAULT: begin
         gate_open_cmd = 1'b0;
         gate_close_cmd = 1'b1;
       end

       OPENING: begin
         gate_open_cmd = 1'b1;
         gate_close_cmd = 1'b0;
       end

       default: begin
         gate_open_cmd = 1'b0;
         gate_close_cmd = 1'b1;
         warning      = 1'b1;
         road_red     = 1'b1;
         road_green = 1'b0;
       end

    endcase
  end

endmodule
