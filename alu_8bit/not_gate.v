`timescale 1ns / 1ps

module not_gate (
    input [7:0] a,
    output [7:0] y
);
    assign y = ~a;
endmodule