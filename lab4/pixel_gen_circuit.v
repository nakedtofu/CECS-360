`timescale 1ns / 1ps

//****************************************************************// 
//  File name: <pixel_gen_circuit.v>                              // 
//                                                                // 
//  Created by Naoaki Takatsu on 04/9/2018.                       // 
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

module pixel_gen_circuit(clk, reset, pixel_x, pixel_y, video_on, RGB);

	input clk, reset, video_on;
   input [9:0] pixel_x, pixel_y;
	output reg [11:0] RGB;
	
	always @ (posedge clk, posedge reset)
	begin
	
	   if(reset)
		   RGB <= 12'b0;
				
		else if(video_on == 1'b1)
		begin
			
			RGB <= 12'b111111111111;
			
			//wall
		   if( (pixel_x >= 32) && (pixel_x <= 35) )
			   RGB <= 12'b000000001111;
			
			//paddle
			if( (pixel_x >= 600) && (pixel_x <= 603) &&
   			 (pixel_y >= 204) && (pixel_y <= 276) )
				RGB <= 12'b000011110000;
			
			//ball
			if( (pixel_x >= 580) && (pixel_x <= 588) &&
			    (pixel_y >= 238) && (pixel_y <= 246) )
			   RGB <= 12'b111100000000;
				
		end
		
		else if(video_on == 1'b0)
		   RGB <= 12'b0;
		
		else
		   RGB <= RGB;
		
	end
		
	
endmodule
