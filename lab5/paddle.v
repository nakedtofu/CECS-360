`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:30 04/25/2018 
// Design Name: 
// Module Name:    paddle 
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
module paddle(clk, reset, button_up, button_down, paddle_top);
	 
   input clk, reset, button_up, button_down;
   output reg [9:0] paddle_top;
	reg [9:0] new_paddle_top;
	
	localparam bottom_w = 480; //bottom wall pixel
	localparam height_p = 72; //height of paddle
	
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
		   paddle_top <= 204;
		
		else if (refr_tick)
		   paddle_top <= new_paddle_top;
			
		else
		   paddle_top <= paddle_top;

	end

	always @ (*)
	begin
	
	   new_paddle_top = 1'b0;
		
		if( button_up && ( paddle_top > 0 ) )
		   new_paddle_top = paddle_top - 3'b100;
			
		else if( button_down && ( paddle_top < ( bottom_w - height_p ) ) )
		   new_paddle_top = paddle_top + 3'b100;
			
		else
		   new_paddle_top = paddle_top;
	
	end

endmodule
