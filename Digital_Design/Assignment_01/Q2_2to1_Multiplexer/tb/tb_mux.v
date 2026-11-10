`timescale 1ns/1ps
module tb_mux;
    reg I0, I1, S;
    wire Y_assign, Y_conditional, Y_always, Y_if_else, Y_case, Y_gate_level;

    mux_assign M1(.I0(I0), .I1(I1), .S(S), .Y(Y_assign));
    mux_conditional M2(.I0(I0), .I1(I1), .S(S), .Y(Y_conditional));
    mux_always M3(.I0(I0), .I1(I1), .S(S), .Y(Y_always));
    mux_if_else M4(.I0(I0), .I1(I1), .S(S), .Y(Y_if_else));
    mux_case M5(.I0(I0), .I1(I1), .S(S), .Y(Y_case));
    mux_gate_level M6(.I0(I0), .I1(I1), .S(S), .Y(Y_gate_level));

    initial begin
        I0=0; I1=0; S=0; #10;
        I0=0; I1=1; S=0; #10;
        I0=1; I1=0; S=0; #10;
        I0=1; I1=1; S=0; #10;
        I0=0; I1=0; S=1; #10;
        I0=0; I1=1; S=1; #10;
        I0=1; I1=0; S=1; #10;
        I0=1; I1=1; S=1; #10;
        $finish;
    end
endmodule
