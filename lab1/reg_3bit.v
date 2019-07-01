`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:37:09 02/19/2018 
// Design Name: 
// Module Name:    reg_3bit 
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
module reg_3bit(clk, reset, d, q);

   input clk, reset;
	input [2:0] d;
	output reg [2:0] q;
	
	always @ (posedge clk, posedge reset)
	   if(reset)
		   q <= 3'b0;
		else
		   q <= d;

endmodule
