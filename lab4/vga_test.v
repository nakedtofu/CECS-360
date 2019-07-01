`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:01:46 03/21/2018
// Design Name:   vga_sync
// Module Name:   C:/Users/NAO/Desktop/CECS360/assignment2/assignment2/vga_test.v
// Project Name:  assignment2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga_sync
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vga_test;

	// Inputs
	reg clk;
	reg reset;
	reg [11:0] sw;

	// Outputs
	wire [11:0] RGB;
	wire h_sync;
	wire v_sync;

	// Instantiate the Unit Under Test (UUT)
	vga_sync uut (
		.clk(clk), 
		.reset(reset), 
		.sw(sw), 
		.RGB(RGB), 
		.h_sync(h_sync), 
		.v_sync(v_sync)
	);
	
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		sw = 0;

		// Wait 100 ns for global reset to finish
		#100 reset = 0;
        
		// Add stimulus here
		#100 sw = 12'b000000000001;
		#100 sw = 12'b000000000011;
		//run simulation for 35ms to observe two full cycles

	end
      
endmodule

