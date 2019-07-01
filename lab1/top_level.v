`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <toplevel.v>                                       // 
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

module top_level(resetmeta, uhdl, switch, clk, anode, cathode);
	 
	 input resetmeta, uhdl, switch, clk;
	 output [7:0] anode;
    output [6:0] cathode;
	 wire reset, tick, p_o, ped;
	 wire [31:0] count;
	 
	 AISO aiso(.clk(clk), .resetmeta(resetmeta), .resetout(reset));
	 
	 db_ticker dbt(.clk(clk), .reset(reset), .tick(tick));
	 
	 debounce_2 db(.clk(clk), .reset(reset), .tick(tick), 
	                              .SW(switch), .db(p_o));
						
	 pulse_maker pm(.clk(clk), .reset(reset), .d(p_o), .ped(ped));
	 
	 counter counter(.clk(clk), .reset(reset), .ped(ped), 
	                         .uhdl(uhdl), .count(count));
						 
	 display_controller dc(.clk(clk), .reset(reset), .din(count),
                              .anode(anode), .cathode(cathode));

endmodule
