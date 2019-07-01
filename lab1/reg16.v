`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:04:27 02/14/2018 
// Design Name: 
// Module Name:    reg16 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module reg16(clk, reset, d, q);

   input clk, reset;
	input [7:0] d;
	output reg [7:0] q;
	
	always @ (posedge clk, posedge reset)
	   if(reset)
		   q <= 8'b0;
		else
		   q <= d;

endmodule
