`timescale 1ns / 1ps

module alu_8bit (
    input [7:0] A,          // 8-bit Input A
    input [7:0] B,          // 8-bit Input B
    input [2:0] Opcode,     // 3-bit Operation Selector
    output reg [7:0] Result,// 8-bit ALU Output
    output reg Cout         // Carry Out Flag
);
always @(*) begin
        Cout = 1'b0;
        case (Opcode)
		  3'b000: {Cout, Result} = A + B;       // ADD
            3'b001: {Cout, Result} = A - B;       // SUB
            3'b010: Result = A & B;               // AND
            3'b011: Result = A | B;               // OR
            3'b100: Result = A ^ B;               // XOR
            3'b101: Result = A << 1;              // Shift Left
            3'b110: Result = A >> 1;              // Shift Right
            default: Result = 8'b00000000;
        endcase
    end
	 endmodule