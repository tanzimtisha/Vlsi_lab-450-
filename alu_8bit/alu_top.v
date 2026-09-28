`timescale 1ns / 1ps

module alu_top (
    input clk,
    input rst,
    input en,
    input [7:0] in_a,
    input [7:0] in_b,
    input [2:0] sel,
    output [7:0] alu_out,
    output cout
);
wire [7:0] reg_a_out, reg_b_out;
    wire [7:0] arith_out, logic_out;

    // Registers
    register_8bit RegA (.clk(clk), .rst(rst), .en(en), .d_in(in_a), .d_out(reg_a_out));
    register_8bit RegB (.clk(clk), .rst(rst), .en(en), .d_in(in_b), .d_out(reg_b_out));
	 // Functional Units
    adder_8bit Adder (.a(reg_a_out), .b(reg_b_out), .sum(arith_out), .cout(cout));
    logic_unit LU (.a(reg_a_out), .b(reg_b_out), .sel(sel[1:0]), .out(logic_out));

    // Multiplexer 
    mux_8to1 MUX (.in0(arith_out), .in1(logic_out), .sel(sel), .out(alu_out));

endmodule