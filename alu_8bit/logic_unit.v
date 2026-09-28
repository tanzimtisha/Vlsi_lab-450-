`timescale 1ns / 1ps

module logic_unit (
    input [7:0] a,
    input [7:0] b,
    input [1:0] sel,
    output reg [7:0] out
);
    wire [7:0] w_and, w_or, w_xor, w_nor;
	 and_gate g1 (.a(a), .b(b), .y(w_and));
    or_gate  g2 (.a(a), .b(b), .y(w_or));
    xor_gate g3 (.a(a), .b(b), .y(w_xor));
    nor_gate g4 (.a(a), .b(b), .y(w_nor));

    always @(*) begin
        case (sel)
		  2'b00: out = w_and;
            2'b01: out = w_or;
            2'b10: out = w_xor;
            2'b11: out = w_nor;
            default: out = 8'b00000000;
        endcase
    end
endmodule