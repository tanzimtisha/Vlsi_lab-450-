`timescale 1ns / 1ps

module and_gate (
    input [7:0] a,
    input [7:0] b,
    output [7:0] y
);
    assign y = a & b;
endmodule