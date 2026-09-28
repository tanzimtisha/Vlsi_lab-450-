`timescale 1ns / 1ps

module tb_alu_top;

    // Inputs
    reg clk;
    reg rst;
    reg en;
    reg [7:0] in_a;
    reg [7:0] in_b;
    reg [2:0] sel;

    // Outputs
    wire [7:0] alu_out;
    wire cout;
	 // Instantiate the Unit Under Test (UUT)
    alu_top uut (
        .clk(clk), 
        .rst(rst), 
        .en(en), 
        .in_a(in_a), 
        .in_b(in_b), 
        .sel(sel), 
        .alu_out(alu_out), 
        .cout(cout)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
	 // Initialize Inputs
        clk = 0;
        rst = 1;
        en = 0;
        in_a = 8'd0;
        in_b = 8'd0;
        sel = 3'b000;

        // Reset release
        #20;
        rst = 0;
        en = 1;
		  // Test 1: Addition (in_a = 15, in_b = 10)
        in_a = 8'd15;
        in_b = 8'd10;
        sel = 3'b000;
        #20;

        // Test 2: Logic AND
        in_a = 8'hCC;
        in_b = 8'hAA;
        sel = 3'b000;
        #20;

        // Test 3: Logic OR
        sel = 3'b001;
        #20;
		  // Test 4: Logic XOR
        sel = 3'b010;
        #20;

        // Test 5: Logic NOR
        sel = 3'b011;
        #20;

        // Finish Simulation
        #50;
        $finish;
    end

endmodule