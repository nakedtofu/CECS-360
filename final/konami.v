`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <konami.v>                                         // 
//                                                                // 
//  Created by Naoaki Takatsu on 05/7/2018.                       // 
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
module konami(clk, reset, sw, button_up, button_down,
              button_left, button_right, konami);

	input wire       clk, reset, button_up, button_down,
                 	  button_left, button_right;
	input wire [7:0] sw;
	output reg       konami;

	localparam up1 = 3'b000;
	localparam up2 = 3'b001;
	localparam down1 = 3'b010;
	localparam down2 = 3'b011;
	localparam left1 = 3'b100;
	localparam right1 = 3'b101;
	localparam left2 = 3'b110;
	localparam right2 = 3'b111;
	localparam ab_input = 8'b10101011;
	
	reg n_konami;
	reg [2:0] kstate, n_kstate;
	
	always @ (posedge clk, posedge reset)
	begin
	
	   if (reset)
		begin
			konami <= 1'b0;
			kstate <= up1;
		end
			
		else
		begin
		   konami <= n_konami;
			kstate <= n_kstate;
		end
	
	end

//konami command
   always @ (*)
	begin
	
	   n_kstate = up1;
		n_konami = 1'b0;
	
	   if( sw == ab_input )
		begin
		
		   n_konami = konami;

	      case ( kstate )
		      
				up1:
				   if( button_up )
					   n_kstate = up2;
					else
					   n_kstate = kstate;
				
				up2:
				   if( button_up )
					   n_kstate = down1;
					else
					   n_kstate = kstate;
				
				down1:
				   if( button_down )
					   n_kstate = down2;
					else
					   n_kstate = kstate;
				
				down2:
				   if( button_down )
					   n_kstate = left1;
					else
					   n_kstate = kstate;
				
				left1:
				   if( button_left )
					   n_kstate = right1;
					else
					   n_kstate = kstate;
				
				right1:
				   if(button_right)
					   n_kstate = left2;
					else
					   n_kstate = kstate;
				
				left2:
					if(button_left)
					   n_kstate = right2;
					else
					   n_kstate = kstate;
				
				right2:
					if(button_right)
					begin
					   if( konami == 1'b0 )
					      n_konami = 1'b1;
					   n_kstate = up1;
					end
					else
					   n_kstate = kstate;
				
				default:
				   n_kstate = kstate;
					
		   endcase
			
		end
	
	end

endmodule
