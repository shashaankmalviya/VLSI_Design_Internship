module moore_1001 (
   input clk,
   input reset,
   input x,
   output reg z
);

reg [2:0] state, next_state;

parameter S0 = 3'b000, // Initial state
     S1 = 3'b001, // Detected 1
     S2 = 3'b010, // Detected 10
     S3 = 3'b011, // Detected 100
     S4 = 3'b100; // Detected 1001

// State register with asynchronous reset
always @(posedge clk or posedge reset) begin
   if (reset)
       state <= S0;
   else
       state <= next_state;
end
// Next-state logic
always @(*) begin
   case (state)
     S0: begin
       if (x == 1'b1)
           next_state = S1;
       else
           next_state = S0;
     end

     S1: begin
       if (x == 1'b1)
           next_state = S1;
       else
           next_state = S2;
     end

     S2: begin
       if (x == 1'b1)
           next_state = S1;
       else
           next_state = S3;
     end

     S3: begin
       if (x == 1'b1)
           next_state = S4;
       else
           next_state = S0;
     end

     S4: begin
       if (x == 1'b1)
           next_state = S1;
       else
           next_state = S2;
     end

     default: next_state = S0;
   endcase
end

// Moore output logic
always @(*) begin
   case (state)
       S4:     z = 1'b1;
       default: z = 1'b0;
   endcase
end

endmodule
