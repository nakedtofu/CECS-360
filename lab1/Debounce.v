`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <Debounce.v>                                       // 
//                                                                // 
//  Created by Naoaki Takatsu on 02/12/2018.                      // 
//  Copyright © 2018                                              //
//  Naoaki Takatsu. All rights reserved.                          // 
//                                                                // 
//                                                                // 
//  In submitting this file for class work at CSULB               // 
//  I am confirming that this is my work and the work             // 
//  of no one else. In submitting this code I acknowledge that    // 
//  plagiarism in student project work is subject to dismissal.   //  
//  from the class                                                // 
//****************************************************************//
module Debounce(clk, reset, tick, switch, p_o);
	 
	input clk, reset, switch, tick;
	output reg p_o;
	reg [2:0] p_s;
	reg [2:0] n_s;
	reg n_o;

   always @ (posedge clk, posedge reset)
	   {p_s, p_o} <= (reset) ? {3'b000, 1'b0} : {n_s, n_o};

	always @ (*)
	begin
		
	   n_o = 1'b0;
// the logic of your state machine is wrong
// value = (T/F) ? TRUE : FALSE
	
		case(p_s)
		   3'b000: 
			   if(switch)
				   {n_s, n_o} = {3'b001, 1'b0};
				else if(~switch)
					{n_s, n_o} = {3'b000, 1'b0};
			3'b001: 
				if(switch & tick)
				   {n_s, n_o} = {3'b010, 1'b0};
				else if(switch & ~tick)
				   {n_s, n_o} = {3'b001, 1'b0};
				else if(~switch)
				   {n_s, n_o} = {3'b000, 1'b0};
			3'b010: 
			   if(switch & tick)
				   {n_s, n_o} = {3'b011, 1'b0};
				else if(~switch)
					{n_s, n_o} = {3'b000, 1'b0};
			3'b011: 
			   if(switch & tick)
				   {n_s, n_o} = {3'b100, 1'b1};
				else if(switch & ~tick)
				   {n_s, n_o} = {3'b011, 1'b0};
				else if(~switch)
				   {n_s, n_o} = {3'b000, 1'b0};
			3'b100: 
			   if(~switch)
				   {n_s, n_o} = {3'b101, 1'b1};
				else if(switch)
					{n_s, n_o} = {3'b100, 1'b1};
			3'b101: 
			   if(~switch & tick)
				   {n_s, n_o} = {3'b110, 1'b1};
				else if(~switch & ~tick)
				   {n_s, n_o} = {3'b101, 1'b1};
				else if(switch)
				   {n_s, n_o} = {3'b100, 1'b1};
			3'b110: 
			   if(~switch & tick)
				   {n_s, n_o} = {3'b111, 1'b1};
				else if(switch)
					{n_s, n_o} = {3'b100, 1'b1};
			3'b111: 
			   if(~switch & tick)
				   {n_s, n_o} = {3'b000, 1'b0};
				else if(~switch & ~tick)
				   {n_s, n_o} = {3'b110, 1'b1};
				else if(switch)
				   {n_s, n_o} = {3'b100, 1'b1};
					
			endcase
   
	end
	
endmodule
