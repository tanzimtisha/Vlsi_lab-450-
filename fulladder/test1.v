`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:36:11 09/20/2026
// Design Name:   fulladdar1
// Module Name:   /home/ise/fulladder/test1.v
// Project Name:  fulladder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fulladdar1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test1;

	// Inputs
	reg x;
	reg y;
	reg z;

	// Outputs
	wire s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	fulladdar1 uut (
		.x(x), 
		.y(y), 
		.z(z), 
		.s(s), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		x = 0;
		y = 0;
		z = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		x = 0;
		y = 0;
		z = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		x = 0;
		y = 1;
		z = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		x = 0;
		y = 1;
		z = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		x = 1;
		y = 0;
		z = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		x = 1;
		y = 0;
		z = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		x = 1;
		y = 1;
		z = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		x = 1;
		y = 1;
		z = 1;

		
		
		
        
		// Add stimulus here

	end
      
endmodule

