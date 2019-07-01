`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <ball.v>                                           // 
//                                                                // 
//  Created by Naoaki Takatsu on 04/25/2018.                      // 
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

module ball(clk, reset, p_y, konami, ball_x, ball_y, score);
	 
	input wire        clk, reset, konami;
	input wire  [9:0] p_y;
	output reg  [9:0] ball_x, ball_y;
	output reg [31:0] score;
	
	reg [9:0] new_ball_x, new_ball_y;
	reg [1:0] ball_traject, new_ball_traject;
	reg [31:0] new_score;
	
	localparam left_w = 35; //left wall pixel
	localparam right_w = 639; //right wall pixel
	localparam top_w = 0; //top wall pixel
	localparam bottom_w = 479; //bottom wall pixel
	localparam left_p = 600; //left paddle pixel
	localparam height_p = 72; //height of paddle
	localparam width_b = 8; //width of ball
	 
	//200hz tick generator/////////////////////////////////
	                                                     //
	wire      refr_tick;                                 //
	reg [18:0] count, n_count;                           //
                                                        //
	assign refr_tick = (count == 500000);                //
	                                                     //
	always @ (posedge clk, posedge reset)                //
	   if(reset)                                         //
		   count <= 1'b0;                                 //
		else                                              //
		   count <= n_count;                              //
			                                               //
	always @ (*)                                         //
	   n_count = (refr_tick) ? 1'b0 : (count + 1'b1);    //
		                                                  //
	///////////////////////////////////////////////////////	 
	 
	always @ (posedge clk, posedge reset)
	begin
		
		if( reset )
		begin
		   
			ball_x <= 1'b0;
			ball_y <= 1'b0;
			ball_traject <= 2'b11;
			score <= 1'b0;
			
		end
		
		else if( refr_tick )
		begin
		
		   ball_x <= new_ball_x;
			ball_y <= new_ball_y;
			ball_traject <= new_ball_traject;
			score <= new_score;
		
		end
		
		else
		begin
		
		   ball_x <= ball_x;
			ball_y <= ball_y;
			ball_traject <= ball_traject;
			score <= score;
		
		end

	end
	
	always @ (*)
	begin
	
	   new_ball_x = 1'b0;
	   new_ball_y = 1'b0;
		new_ball_traject = 2'b11;
		new_score = 1'b0;
	
		if ( ( ball_x + width_b ) == right_w ) //right wall
	   begin
	      
			new_ball_x = 1'b0;
		   new_ball_y = 1'b0;
		   new_ball_traject = 2'b11;
			new_score = 1'b0;
		
		end
		
		else
		begin
		
		   new_score = score;
		
   		if ( ( ball_y == top_w ) && ( ball_x == left_w ) &&
     			  ( ball_traject == 2'b00 ) ) //top left corner
	         new_ball_traject = 2'b11;
			
		   else if ( ( ( ball_y + width_b ) == bottom_w ) && ( ball_x == left_w ) && 
			            ( ball_traject == 2'b01 ) ) //bottom left corner
	         new_ball_traject = 2'b10;
	
   	   else if ( ball_x == left_w ) //left wall
	   	begin
	         if ( ball_traject == 2'b01 )
	            new_ball_traject = 2'b11;
   	      if ( ball_traject == 2'b00 )
	            new_ball_traject = 2'b10;
		   end
				
   		else if ( ball_y == top_w ) //top wall
	   	begin
	         if ( ball_traject == 2'b10 )
	            new_ball_traject = 2'b11;
   	      if( ball_traject == 2'b00 )
	            new_ball_traject = 2'b01;
		   end
				
   		else if ( ( ball_y + width_b ) == bottom_w ) //bottom wall
	   	begin
	         if ( ball_traject == 2'b11 )
	            new_ball_traject = 2'b10;
   	      if ( ball_traject == 2'b01 )
	            new_ball_traject = 2'b00;
		   end
			
   		else if ( ( ball_x + width_b == left_p ) && ( ball_y >= p_y ) && 
			          ( ball_y <= ( p_y + height_p ) ) ) //paddle
	   	begin
			   if(score != 32'hFFFFFFFF)
		         new_score = score + 1'b1;
	         if ( ball_traject == 2'b11 )
	            new_ball_traject = 2'b01;
   	      if ( ball_traject == 2'b10 )
	            new_ball_traject = 2'b00;
		   end
		
   		else
	   	   new_ball_traject = ball_traject;
				
			if(konami)
		      new_score = 32'hFFFFFFFF;
	     
		   case( new_ball_traject )
		   
   			2'b00:
	   		begin
		   	   new_ball_x = ball_x - 1'b1;
			   	new_ball_y = ball_y - 1'b1;
   		   end
			
	   		2'b01:
		   	begin
			      new_ball_x = ball_x - 1'b1;
				   new_ball_y = ball_y + 1'b1;
   			end
			
	   		2'b10:
		   	begin
			      new_ball_x = ball_x + 1'b1;
				   new_ball_y = ball_y - 1'b1;
   			end
			
	   		2'b11:
		   	begin
			      new_ball_x = ball_x + 1'b1;
				   new_ball_y = ball_y + 1'b1;
   			end
			
	   		default:
		   	begin
			      new_ball_x = ball_x;
				   new_ball_y = ball_y;
   			end
			
	   	endcase
		
		end
		
	end

endmodule
