`timescale 1ns/1ps
module tb_mux;

reg I0, I1, S;

wire Y_assign;
wire Y_conditional;
wire Y_always;
wire Y_if_else;
wire Y_case;
wire Y_gate_level;

// 1. Dataflow using assign
mux_assign M1 (
   .I0(I0), .I1(I1), .S(S), .Y(Y_assign)
);

// 2. Dataflow using conditional operator
mux_conditional M2 (
   .I0(I0), .I1(I1), .S(S), .Y(Y_conditional)
);

// 3. Behavioral using always block
mux_always M3 (
   .I0(I0), .I1(I1), .S(S), .Y(Y_always)
);

// 4. Behavioral using if-else
mux_if_else M4 (
   .I0(I0), .I1(I1), .S(S), .Y(Y_if_else)
);

// 5. Behavioral using case
mux_case M5 (
   .I0(I0), .I1(I1), .S(S), .Y(Y_case)
);

// 6. Gate-level modeling
mux_gate_level M6 (
   .I0(I0), .I1(I1), .S(S), .Y(Y_gate_level)
);

initial begin
   I0 = 0; I1 = 0; S = 0; #10;
   I0 = 0; I1 = 1; S = 0; #10;
   I0 = 1; I1 = 0; S = 0; #10;
   I0 = 1; I1 = 1; S = 0; #10;
   I0 = 0; I1 = 0; S = 1; #10;
   I0 = 0; I1 = 1; S = 1; #10;
   I0 = 1; I1 = 0; S = 1; #10;
   I0 = 1; I1 = 1; S = 1; #10;
   $finish;
end
endmodule
