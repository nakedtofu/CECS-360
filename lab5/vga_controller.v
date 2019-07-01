`timescale 1ns / 1ps

//****************************************************************// 
//  File name: <vga_controller.v>                                 // 
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

module vga_controller(clk, reset, h_sync, v_sync, button_up, button_down, RGB);

	input             clk, reset, button_up, button_down;
	output wire        h_sync, v_sync;
	output wire [11:0] RGB;
	wire              video_on;
	wire        [9:0] pixel_x, pixel_y, pad_y, ball_x, ball_y;
	
	vga_sync vga_sync(.clk(clk), .reset(reset), .x_count(pixel_x),
	                  .y_count(pixel_y), .vid_on(video_on),
							.h_sync(h_sync), .v_sync(v_sync));
							
	paddle paddle_mod(.clk(clk), .reset(reset), .button_up(button_up), 
	                  .button_down(button_down), .paddle_top(pad_y));
	
	ball ball_mod(.clk(clk), .reset(reset), .p_y(pad_y), 
	              .ball_x(ball_x), .ball_y(ball_y) );
							
	pixel_gen_circuit pix_gen_circuit(.clk(clk), .reset(reset), 
	                                  .pixel_x(pixel_x), .pixel_y(pixel_y),
												 .video_on(video_on), .paddle_y(pad_y), 
												 .ball_x(ball_x), .ball_y(ball_y), .RGB(RGB));

endmodule
