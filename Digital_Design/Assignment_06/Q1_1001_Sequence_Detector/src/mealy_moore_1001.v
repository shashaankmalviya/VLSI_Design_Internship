`timescale 1ns/1ps
module mealy_1001(input clk, reset, x, output reg z);
    reg [1:0] state, next_state;
    parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;

    always @(posedge clk or posedge reset) begin
        if (reset) state <= S0;
        else state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: if (x) next_state=S1; else next_state=S0;
            S1: if (x) next_state=S1; else next_state=S2;
            S2: if (x) next_state=S1; else next_state=S3;
            S3: if (x) next_state=S1; else next_state=S0;
            default: next_state=S0;
        endcase
    end

    always @(*) begin
        z=1'b0;
        if (state==S3 && x==1'b1) z=1'b1;
    end
endmodule

module moore_1001(input clk, reset, x, output reg z);
    reg [2:0] state, next_state;
    parameter S0=3'b000, S1=3'b001, S2=3'b010,
              S3=3'b011, S4=3'b100;

    always @(posedge clk or posedge reset) begin
        if (reset) state <= S0;
        else state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: if (x) next_state=S1; else next_state=S0;
            S1: if (x) next_state=S1; else next_state=S2;
            S2: if (x) next_state=S1; else next_state=S3;
            S3: if (x) next_state=S4; else next_state=S0;
            S4: if (x) next_state=S1; else next_state=S2;
            default: next_state=S0;
        endcase
    end

    always @(*) begin
        case (state)
            S4: z=1'b1;
            default: z=1'b0;
        endcase
    end
endmodule
