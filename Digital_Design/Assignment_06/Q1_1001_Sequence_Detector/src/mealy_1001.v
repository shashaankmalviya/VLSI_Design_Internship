module mealy_1001 (
   input clk,
   input reset,
   input x,
   output reg z
);

reg [1:0] state, next_state;
parameter S0 = 2'b00, // No match
       S1 = 2'b01, // Detected 1
       S2 = 2'b10, // Detected 10
       S3 = 2'b11; // Detected 100

// State register
always @(posedge clk or posedge reset) begin
   if (reset)
       state <= S0;
   else
       state <= next_state;
end

// Next-state logic
always @(*) begin
   case (state)
     S0: if (x) next_state = S1;
        else next_state = S0;

     S1: if (x) next_state = S1;
       else next_state = S2;

     S2: if (x) next_state = S1;
       else next_state = S3;

     S3: if (x) next_state = S1;
       else next_state = S0;

    default: next_state = S0;
  endcase
end

// Mealy output logic
always @(*) begin
   z = 1'b0;
   if (state == S3 && x == 1'b1)
       z = 1'b1;
end

endmodule
