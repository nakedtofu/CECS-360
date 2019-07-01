`timescale 1ns / 1ps

//****************************************************************// 
//  File name: <vga_controller_tb.v>                              // 
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

//*************************************************//
// !!!RUN SIMULATION FOR 80ms FOR FULL CHECKING!!! //
//*************************************************//

module vga_controller_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire h_sync;
	wire v_sync;
	wire [11:0] RGB; 
	integer i = 0;

	// Instantiate the Unit Under Test (UUT)
	vga_controller uut (
		.clk(clk), 
		.reset(reset), 
		.h_sync(h_sync), 
		.v_sync(v_sync), 
		.RGB(RGB)
	);
	
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100 reset = 0;
        
		// Add stimulus here
		
		//1
		$display("Req. 1");
		$display("h_sync: ", uut.h_sync, ", v_sync: ",
         		uut.v_sync, ", RGB: ", uut.RGB);
		
		//2
		$display("");
		$display("Req. 2");
		#5 while(i < 4)
		begin
		   @ (uut.pixel_x)
			   $display("horizontal count updated at: ", $stime, "ns");
			i = i + 1;
		end
		i = 0;
		
		//3
		$display("");
		$display("Req. 3");
		#5 while(i < 4)
		begin
		   @ (uut.pixel_x)
			   $display("horizontal count updated at: ", $stime, "ns");
			i = i + 1;
		end
		i = 0;
		
		//4
		#5
		$display("");
		$display("Req. 4");
		@ (uut.pixel_x == 797)
		   #5 while(i < 4)
		   begin
		      @ (uut.pixel_x)
			      $display("horizontal count: ", uut.pixel_x);
			   i = i + 1;
		   end
		i = 0;
		
		//5
		$display("");
		$display("Req. 5");
		@ (negedge uut.h_sync)
		   $display("horizontal count: ", uut.pixel_x);
			
		@ (posedge uut.h_sync)
		   // minus 1 to account for positive edge
		   $display("horizontal count: ", uut.pixel_x - 1'b1);
		
		//6
		$display("");
		$display("Req. 6");
		@ (posedge uut.vga_sync.xvid_on)
		   $display("horizontal count: ", uut.pixel_x);		
			
		@ (negedge uut.vga_sync.xvid_on)
		   // minus 1 to account for negative edge
		   $display("horizontal count: ", uut.pixel_x - 1'b1);
			
		//7
		$display("");
		$display("Req. 7");
		@ (uut.pixel_x == 799)
		   $display("vertical count: ", uut.pixel_y);

		@ (uut.pixel_x == 0)
		   $display("vertical count: ", uut.pixel_y);
			
		//8
		$display("");
		$display("Req. 8");
		@ (uut.pixel_y == 522)
		   #5 while(i < 4)
		   begin
		      @ (uut.pixel_y)
			      $display("vertical count: ", uut.pixel_y);
			   i = i + 1;
		   end
		i = 0;
		
		//9
		$display("");
		$display("Req. 9");
		@ (negedge uut.v_sync)
		   // plus 1 to account for negative edge
		   $display("vertical count: ", uut.pixel_y + 1'b1);
			
		@ (posedge uut.v_sync)
		   $display("vertical count: ", uut.pixel_y);
			
		//10
		$display("");
		$display("Req. 10");
		@ (posedge uut.vga_sync.yvid_on)
		   $display("vertical count: ", uut.pixel_y);		
			
		@ (negedge uut.vga_sync.yvid_on)
		   // minus 1 to account for negative edge
		   $display("vertical count: ", uut.pixel_y - 1'b1);
			
		//11
		$display("");
		$display("Req. 11");
		@ ((uut.vga_sync.xvid_on == 1) && (uut.vga_sync.yvid_on == 1))
		   $display("video on: ", uut.vga_sync.nvid_on);

		//12
		$display("");
		$display("Req. 12");
		@ (uut.video_on != 1)
		   $display("RGB: ", uut.RGB);		
		
		@ (uut.video_on)
		   $display("RGB: ", uut.RGB);			
			
		//13
		$display("");
		$display("Req. 13 Wall");
		@ (uut.pixel_x == 31)
		   #5 while(i < 6)
		   begin
		      @ (uut.pixel_x)
				   //minus 1 to account for single tick delay
			      $display("RGB at horizontal count",
					uut.pixel_x - 1'b1, ": ", uut.RGB);
			   i = i + 1;
		   end
		i = 0;
			
		//14
		$display("");
		$display("Req. 14 Paddle");
		//just above top border
		$display("");
		$display("just above top border");
		@ ((uut.pixel_y == 203) && (uut.pixel_x == 599))
		   #5 while(i < 6)
		   begin
		      @ (uut.pixel_x)
				   //minus 1 to account for single tick delay
			      $display("RGB at vertical count ", uut.pixel_y,
					" and horizontal count ", uut.pixel_x - 1'b1, ": ", uut.RGB);
			   i = i + 1;
		   end
		i = 0;	
		
		//top border
		$display("");
		$display("top border");
		@ ((uut.pixel_y == 204) && (uut.pixel_x == 599))
		   #5 while(i < 6)
		   begin
		      @ (uut.pixel_x)
				   //minus 1 to account for single tick delay
			      $display("RGB at vertical count ", uut.pixel_y,
					" and horizontal count ", uut.pixel_x - 1'b1, ": ", uut.RGB);
			   i = i + 1;
		   end
		i = 0;
		
		//bottom border
		$display("");
		$display("bottom border");
		@ ((uut.pixel_y == 276) && (uut.pixel_x == 599))
		   #5 while(i < 6)
		   begin
		      @ (uut.pixel_x)
				   //minus 1 to account for single tick delay
			      $display("RGB at vertical count ", uut.pixel_y,
					" and horizontal count ", uut.pixel_x - 1'b1, ": ", uut.RGB);
			   i = i + 1;
		   end
		i = 0;
		
		//just below bottom
		$display("");
		$display("just below bottom border");
		@ ((uut.pixel_y == 277) && (uut.pixel_x == 599))
		   #5 while(i < 6)
		   begin
		      @ (uut.pixel_x)
				   //minus 1 to account for single tick delay
			      $display("RGB at vertical count ", uut.pixel_y,
					" and horizontal count ", uut.pixel_x - 1'b1, ": ", uut.RGB);
			   i = i + 1;
		   end
		i = 0;
			
		//15
		$display("");
		$display("Req. 15 Ball");
		
		//just above top border
		$display("");
		$display("just above top border");
		@ ((uut.pixel_y == 237) && (uut.pixel_x == 579))
		   #5 while(i < 11)
		   begin
		      @ (uut.pixel_x)
				   //minus 1 to account for single tick delay
			      $display("RGB at vertical count ", uut.pixel_y,
					" and horizontal count ", uut.pixel_x - 1'b1, ": ", uut.RGB);
			   i = i + 1;
		   end
		i = 0;	
		
		//top border
		$display("");
		$display("top border");
		@ ((uut.pixel_y == 238) && (uut.pixel_x == 579))
		   #5 while(i < 11)
		   begin
		      @ (uut.pixel_x)
				   //minus 1 to account for single tick delay
			      $display("RGB at vertical count ", uut.pixel_y,
					" and horizontal count ", uut.pixel_x - 1'b1, ": ", uut.RGB);
			   i = i + 1;
		   end
		i = 0;
		
		//bottom border
		$display("");
		$display("bottom border");
		@ ((uut.pixel_y == 246) && (uut.pixel_x == 579))
		   #5 while(i < 11)
		   begin
		      @ (uut.pixel_x)
				   //minus 1 to account for single tick delay
			      $display("RGB at vertical count ", uut.pixel_y,
					" and horizontal count ", uut.pixel_x - 1'b1, ": ", uut.RGB);
			   i = i + 1;
		   end
		i = 0;
		
		//just below bottom border
		$display("");
		$display("just below bottom border");
		@ ((uut.pixel_y == 277) && (uut.pixel_x == 579))
		   #5 while(i < 11)
		   begin
		      @ (uut.pixel_x)
				   //minus 1 to account for single tick delay
			      $display("RGB at vertical count ", uut.pixel_y,
					" and horizontal count ", uut.pixel_x - 1'b1, ": ", uut.RGB);
			   i = i + 1;
		   end
		i = 0;
			
	end
      
endmodule
