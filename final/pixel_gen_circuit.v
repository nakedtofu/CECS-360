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

module pixel_gen_circuit(clk, reset, pixel_x, pixel_y, video_on,
                         konami, paddle_y, ball_x, ball_y, RGB);

	input clk, reset, video_on, konami;
   input [9:0] pixel_x, pixel_y, paddle_y, ball_x, ball_y;
	output reg [11:0] RGB;
	reg [11:0] new_RGB;
	
	localparam height_p = 72; //height of paddle
	localparam height_b = 8; //height of paddle
	localparam width_b = 8; //height of paddle
	
	always @ (posedge clk, posedge reset)
	begin
	
	   if(reset)
		   RGB <= 12'b000000000000;
		
		else
		   RGB <= new_RGB;
		
	end
		
	always @ (*)
	begin
	
	   new_RGB = 12'b000000000000;
	
	   if(video_on == 1'b1)
		begin
	
	      new_RGB = 12'b111111111111;
			
			if(konami)
			begin
			
			   new_RGB = 12'b001111000000;
			
			   //wall
		      if( (pixel_x >= 32) && (pixel_x <= 35) )
		         new_RGB = 12'b111111111111;
			
		      //paddle
      		if( (pixel_x >= 600) && (pixel_x <= 603) &&
         		 (pixel_y >= paddle_y) && (pixel_y <= paddle_y + height_p) )
		   	   new_RGB = 12'b000000000000;
			
   		   //ball
	   	   if( (pixel_x >= ball_x) && (pixel_x <= ball_x + width_b) &&
		          (pixel_y >= ball_y) && (pixel_y <= ball_y + height_b) &&
					 ( (pixel_x < 100) || (pixel_x > 400) ) )
		         new_RGB = 12'b000000001111;
					
				//handicap overlay
		      if( (pixel_x >= 100) && (pixel_x <= 400) )
		         new_RGB = 12'b110011100000;
			
			end
			
			else
			begin
			
			   new_RGB = 12'b111111111111;
			
	      	//wall
	   	   if( (pixel_x >= 32) && (pixel_x <= 35) )
   		      new_RGB = 12'b000000001111;
			
		      //paddle
   	   	if( (pixel_x >= 600) && (pixel_x <= 603) &&
         		 (pixel_y >= paddle_y) && (pixel_y <= paddle_y + height_p) )
   		   	new_RGB = 12'b000011110000;
			
      		//ball
	      	if( (pixel_x >= ball_x) && (pixel_x <= ball_x + width_b) &&
		          (pixel_y >= ball_y) && (pixel_y <= ball_y + height_b) )
		         new_RGB = 12'b111100000000;
				
			end
			
		end
		
		else if(video_on == 1'b0)
		   new_RGB = 12'b000000000000;
		
		else
		   new_RGB = RGB;
	
	end
	
endmodule
