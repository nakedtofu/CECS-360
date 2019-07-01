`timescale 1ns / 1ps

//****************************************************************// 
//  File name: <top_level_tf.v>                                   // 
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

module top_level_tf;

	// Inputs
	reg resetmeta;
	reg uhdl;
	reg switch;
	reg clk;

	// Outputs
	wire [7:0] anode;
	wire [6:0] cathode;

	// Instantiate the Unit Under Test (UUT)
	top_level uut (
		.resetmeta(resetmeta), 
		.uhdl(uhdl), 
		.switch(switch), 
		.clk(clk), 
		.anode(anode), 
		.cathode(cathode)
	);

   always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		resetmeta = 1;
		uhdl = 0;
		switch = 0;
		clk = 0;

		// Wait 1us for global reset to finish
		#100 resetmeta = 0;
       
		// Add stimulus here 
		#100 uhdl = 1;
		#100 switch = 1;


	end
      
endmodule

