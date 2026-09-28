`timescale 1ns / 1ps

module mux_8to1 (
    input [7:0] in0,     // Adder / Arithmetic Output
    input [7:0] in1,     // Logic Unit Output
    input [2:0] sel,     // Selection Signal
    output reg [7:0] out // Final ALU Output
);
    always @(*) begin
        case (sel[0])    
            1'b0: out = in0;
            1'b1: out = in1;
            default: out = in0;
        endcase
    end
endmodule