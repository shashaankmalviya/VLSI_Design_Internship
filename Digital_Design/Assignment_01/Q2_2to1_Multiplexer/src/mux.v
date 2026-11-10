`timescale 1ns/1ps
module mux_assign(input I0, I1, S, output Y);
    assign Y = (~S & I0) | (S & I1);
endmodule

module mux_conditional(input I0, I1, S, output Y);
    assign Y = S ? I1 : I0;
endmodule

module mux_always(input I0, I1, S, output reg Y);
    always @(*) Y = S ? I1 : I0;
endmodule

module mux_if_else(input I0, I1, S, output reg Y);
    always @(*) begin
        if (S == 1'b0) Y = I0;
        else Y = I1;
    end
endmodule

module mux_case(input I0, I1, S, output reg Y);
    always @(*) begin
        case (S)
            1'b0: Y = I0;
            1'b1: Y = I1;
            default: Y = 1'b0;
        endcase
    end
endmodule

module mux_gate_level(input I0, I1, S, output Y);
    wire Sbar, T0, T1;
    not (Sbar, S);
    and (T0, I0, Sbar);
    and (T1, I1, S);
    or (Y, T0, T1);
endmodule
