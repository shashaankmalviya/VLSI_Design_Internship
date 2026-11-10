`timescale 1ns/1ps
// 1. Dataflow using continuous assignment
module mux_assign (
   input I0, I1, S,
   output Y
);
   assign Y = (~S & I0) | (S & I1);
endmodule

// 2. Dataflow using conditional operator
module mux_conditional (
   input I0, I1, S,
   output Y
);
   assign Y = S ? I1 : I0;
endmodule

// 3. Behavioral using always block
module mux_always (
   input I0, I1, S,
   output reg Y
);
   always @(*) begin
      Y = S ? I1 : I0;
   end
endmodule

// 4. Behavioral using if-else
module mux_if_else (
   input I0, I1, S,
   output reg Y
);
   always @(*) begin
      if (S == 1'b0)
         Y = I0;
      else
         Y = I1;
   end
endmodule

// 5. Behavioral using case statement
module mux_case (
   input I0, I1, S,
   output reg Y
);
   always @(*) begin
      case (S)
         1'b0: Y = I0;
         1'b1: Y = I1;
         default: Y = 1'b0;
      endcase
   end
endmodule

// 6. Gate-level using logic primitives
module mux_gate_level (
   input I0, I1, S,
   output Y
);
   wire Sbar, T0, T1;
   not (Sbar, S);
   and (T0, I0, Sbar);
   and (T1, I1, S);
   or (Y, T0, T1);
endmodule
