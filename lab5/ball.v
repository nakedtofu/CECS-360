`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:25:39 04/30/2018 
// Design Name: 
// Module Name:    ball 
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
module ball(clk, reset, p_y, ball_x, ball_y);
	 
	input wire clk, reset;
	input wire [9:0] p_y;
	output reg [9:0] ball_x, ball_y;
	
	reg [9:0] new_ball_x, new_ball_y;
	reg [1:0] ball_tradject, new_ball_tradject;
	
	localparam left_w = 35; //left wall pixel
	localparam right_w = 639; //right wall pixel
	localparam top_w = 0; //top wall pixel
	localparam bottom_w = 479; //bottom wall pixel
	localparam left_p = 600; //left paddle pixel
	localparam height_p = 72; //height of paddle
	localparam width_b = 8; //width of ball
	 
	//60Hz tick generator//////////////////////////////////
	                                                     //
	wire      refr_tick;                                 //
	reg [20:0] count;                                    //
	reg [20:0] n_count;                                  //
                                                        //
	//100MHz/1,666,667 = 60hz                            //
	assign refr_tick = (count == 1666667);               //
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
		
		if(reset)
		begin
		   
			ball_x <= 1'b0;
			ball_y <= 1'b0;
			ball_tradject <= 2'b11;
			
		end
		
		else if(refr_tick)
		begin
		
		   ball_x <= new_ball_x;
			ball_y <= new_ball_y;
			ball_tradject <= new_ball_tradject;
		
		end
		
		else
		begin
		
		   ball_x <= ball_x;
			ball_y <= ball_y;
			ball_tradject <= ball_tradject;
		
		end

	end
	
	always @ (*)
	begin
	
	   new_ball_x = 1'b0;
	   new_ball_y = 1'b0;
		new_ball_tradject = 2'b11;
	
		if ( (ball_x + width_b) == right_w) //right wall
	   begin
	      
			new_ball_x = 1'b0;
		   new_ball_y = 1'b0;
		   new_ball_tradject = 2'b11;
		
		end
		
		else
		begin
		
		if ( (ball_y == top_w) && (ball_x == left_w) && (ball_tradject == 2'b00) ) //top left corner
	        new_ball_tradject = 2'b11;
			
		else if ( ( (ball_y + width_b) == bottom_w) && (ball_x == left_w) && (ball_tradject == 2'b01) ) //bottom left corner
	        new_ball_tradject = 2'b10;
	
	   else if (ball_x == left_w) //left wall
		begin
	        if (ball_tradject == 2'b01)
	           new_ball_tradject = 2'b11;
	        if (ball_tradject == 2'b00)
	           new_ball_tradject = 2'b10;
			  //else
			    // new_ball_tradject = new_ball_tradject;
		end
				
		else if (ball_y == top_w) //top wall
		begin
	        if (ball_tradject == 2'b10)
	           new_ball_tradject = 2'b11;
	        if(ball_tradject == 2'b00)
	           new_ball_tradject = 2'b01;
			  //else
			    // new_ball_tradject = new_ball_tradject;
		end
				
		else if ( (ball_y + width_b) == bottom_w ) //bottom wall
		begin
	        if (ball_tradject == 2'b11)
	           new_ball_tradject = 2'b10;
	        if (ball_tradject == 2'b01)
	           new_ball_tradject = 2'b00;
			  //else
			    // new_ball_tradject = new_ball_tradject;
		end
			
		else if ( (ball_x + width_b == left_p) && (ball_y >= p_y) && (ball_y <= (p_y + height_p) ) ) //paddle
		begin
	        if (ball_tradject == 2'b11)
	           new_ball_tradject = 2'b01;
	        if (ball_tradject == 2'b10)
	           new_ball_tradject = 2'b00;
			  //else
		       // new_ball_tradject = new_ball_tradject;
		end
		
		else
		   new_ball_tradject = ball_tradject;
	     
		case(new_ball_tradject)
		   
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
