`timescale 1ns / 1ps

module register_8bit (
    input clk,
    input rst,
    input en,
    input [7:0] d_in,
    output reg [7:0] d_out
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            d_out <= 8'b00000000;
        else if (en)
            d_out <= d_in;
    end
endmodule