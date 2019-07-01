`timescale 1ns / 1ps

//****************************************************************// 
//  File name: <vga_sync.v>                                       // 
//                                                                // 
//  Created by Naoaki Takatsu on 03/7/2018.                       // 
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

module vga_sync(clk, reset, x_count, y_count, vid_on, h_sync, v_sync);
	 
   input            clk, reset;
   output reg       h_sync, v_sync, vid_on;
   output reg [9:0] x_count, y_count;
	
	localparam XD = 640; //horizontal display area
   localparam LB =  48; //left border
   localparam RB =  16; //right border
   localparam XR =  96; //h.retrace
   localparam YD = 480; //vertical display area
   localparam TB =  33; //top border
   localparam BB =  10; //bottom border
   localparam YR =   2; //v.retrace
	
	// next sync counters
	reg [9:0] x_ncount, y_ncount;
	
   // output buffer
   reg nh_sync, nv_sync;
	
	// present video on
	reg xvid_on, yvid_on;
	
	// next video off
	reg nxvid_on, nyvid_on, nvid_on;
	
	// total width and height of VGA display
	wire [9:0] x_max, y_max;
	
	// status signals
   // x counter endpt(799)
   assign x_max = XD + RB + XR + LB - 1'b1;
	
   // y counter endpt(524)
   assign y_max = YD + BB + YR + TB - 1'b1;
	
	//25MHz tick generator////////////////////////////
	                                                //
	wire      tick;                                 //
	reg [1:0] count;                                //
	reg [1:0] n_count;                              //
                                                   //
	assign tick = (count == 3); //100MHz/4 = 25Hhz  //
	                                                //
	always @ (posedge clk, posedge reset)           //
	   if(reset)                                    //
		   count <= 1'b0;                            //
		else                                         //
		   count <= n_count;                         //
			                                          //
	always @ (*)                                    //
	   n_count = (tick) ? 1'b0 : (count + 1'b1);    //
		                                             //
	//////////////////////////////////////////////////
	
	
	always @ (posedge clk, posedge reset)
	begin
	
	   if(reset)
		begin
		
		   x_count <= 1'b0;
			y_count <= 1'b0;
			h_sync <= 1'b1;
			v_sync <= 1'b1;
			xvid_on <= 1'b0;
			yvid_on <= 1'b0;
			vid_on <= 1'b0;
			
		end
	   else
		begin
		
		   x_count <= x_ncount;
			y_count <= y_ncount;
			h_sync <= nh_sync;
			v_sync <= nv_sync;
			xvid_on <= nxvid_on;
			yvid_on <= nyvid_on;
			vid_on <= nvid_on;
			
		end
		
	end
		
	always @ (*)
	begin
	
		x_ncount = 1'b0;
		y_ncount = 1'b0;
		nh_sync = 1'b1;
		nv_sync = 1'b1;
		nxvid_on = 1'b0;
		nyvid_on = 1'b0;
		nvid_on = 1'b0;
	
	   if((y_count == y_max) && (x_count == x_max))
	      y_ncount = 1'b0;
	   else if((x_count == x_max) && (count == 3))
	      y_ncount = y_count + 1'b1;
		else
		   y_ncount = y_count;
			
		if( x_count < XD )
		   nxvid_on = 1'b1;
		else
		   nxvid_on = 1'b0;
			
		if( y_count < YD )
		   nyvid_on = 1'b1;
		else
		   nyvid_on = 1'b0;
			
		if(xvid_on && yvid_on)
		   nvid_on = 1'b1;
		else
		   nvid_on = 1'b0;
	
	   if(tick)
		begin
		
		   if(x_count == x_max)
            x_ncount = 1'b0;
      	else
			   x_ncount = x_count + 1'b1;
		
	      if( (x_count >= (XD + RB - 1) ) &&
			    (x_count < (XD + RB + XR -1) ) )
		      nh_sync = 1'b0;
			else
			   nh_sync = 1'b1;
			
		   if( (y_count >= (YD + BB - 1) ) &&
			    (y_count < (YD + BB + YR - 1) ) )
		      nv_sync = 1'b0;
			else
			   nv_sync = 1'b1;
			
		end
		else
		begin
		   x_ncount = x_count;
			y_ncount = y_count;
			nh_sync = h_sync;
			nv_sync = v_sync;
		end

	end

endmodule
