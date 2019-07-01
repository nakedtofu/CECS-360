////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: top_level_synthesis.v
// /___/   /\     Timestamp: Tue Feb 20 11:58:20 2018
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim top_level.ngc top_level_synthesis.v 
// Device	: xc7a100t-3-csg324
// Input file	: top_level.ngc
// Output file	: C:\Users\NAO\Desktop\CECS360\assignment1_2\netgen\synthesis\top_level_synthesis.v
// # of Modules	: 1
// Design Name	: top_level
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module top_level (
  resetmeta, uhdl, switch, clk, anode, cathode
);
  input resetmeta;
  input uhdl;
  input switch;
  input clk;
  output [7 : 0] anode;
  output [6 : 0] cathode;
  wire resetmeta_IBUF_0;
  wire clk_BUFGP_1;
  wire reset;
  wire cathode_6_OBUF_11;
  wire cathode_2_OBUF_12;
  wire \aiso/regOk/q_13 ;
  wire \aiso/regMeta/q_14 ;
  wire \dc/pix_con/present_state_FSM_FFd3_15 ;
  wire \dc/pix_con/present_state_FSM_FFd2_16 ;
  wire \dc/pix_con/present_state_FSM_FFd1_17 ;
  wire \dc/tick ;
  wire \Result<0>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_0 ;
  wire \Result<1>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_1 ;
  wire \Result<2>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_2 ;
  wire \Result<3>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_3 ;
  wire \Result<4>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_4 ;
  wire \Result<5>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_5 ;
  wire \Result<6>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_6 ;
  wire \Result<7>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_7 ;
  wire \Result<8>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_8 ;
  wire \Result<9>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_9 ;
  wire \Result<10>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_10 ;
  wire \Result<11>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_11 ;
  wire \Result<12>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_12 ;
  wire \Result<13>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_13 ;
  wire \Result<14>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_14 ;
  wire \Result<15>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_15 ;
  wire \Result<16>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_16 ;
  wire \Result<17>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_17 ;
  wire \Result<18>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_18 ;
  wire \Result<19>2 ;
  wire \dc/clk_ticker/Mcount_count_eqn_19 ;
  wire \dc/pix_con/present_state_FSM_FFd1-In ;
  wire \dc/pix_con/present_state_FSM_FFd2-In ;
  wire \dc/pix_con/present_state_FSM_FFd3-In ;
  wire \dc/clk_ticker/tick<19>1_103 ;
  wire \dc/clk_ticker/tick<19>2_104 ;
  wire \dc/clk_ticker/Mcount_count_cy<1>_rt_122 ;
  wire \dc/clk_ticker/Mcount_count_cy<2>_rt_123 ;
  wire \dc/clk_ticker/Mcount_count_cy<3>_rt_124 ;
  wire \dc/clk_ticker/Mcount_count_cy<4>_rt_125 ;
  wire \dc/clk_ticker/Mcount_count_cy<5>_rt_126 ;
  wire \dc/clk_ticker/Mcount_count_cy<6>_rt_127 ;
  wire \dc/clk_ticker/Mcount_count_cy<7>_rt_128 ;
  wire \dc/clk_ticker/Mcount_count_cy<8>_rt_129 ;
  wire \dc/clk_ticker/Mcount_count_cy<9>_rt_130 ;
  wire \dc/clk_ticker/Mcount_count_cy<10>_rt_131 ;
  wire \dc/clk_ticker/Mcount_count_cy<11>_rt_132 ;
  wire \dc/clk_ticker/Mcount_count_cy<12>_rt_133 ;
  wire \dc/clk_ticker/Mcount_count_cy<13>_rt_134 ;
  wire \dc/clk_ticker/Mcount_count_cy<14>_rt_135 ;
  wire \dc/clk_ticker/Mcount_count_cy<15>_rt_136 ;
  wire \dc/clk_ticker/Mcount_count_cy<16>_rt_137 ;
  wire \dc/clk_ticker/Mcount_count_cy<17>_rt_138 ;
  wire \dc/clk_ticker/Mcount_count_cy<18>_rt_139 ;
  wire \dc/clk_ticker/Mcount_count_xor<19>_rt_140 ;
  wire \dc/clk_ticker/tick<19>4_rstpot_141 ;
  wire \dc/pix_con/present_out_0_dpot_142 ;
  wire \dc/pix_con/present_out_1_dpot_143 ;
  wire \dc/pix_con/present_out_2_dpot_144 ;
  wire \dc/pix_con/present_out_3_dpot_145 ;
  wire \dc/pix_con/present_out_4_dpot_146 ;
  wire \dc/pix_con/present_out_5_dpot_147 ;
  wire \dc/pix_con/present_out_6_dpot_148 ;
  wire \dc/pix_con/present_out_7_dpot_149 ;
  wire [7 : 0] \dc/pix_con/present_out ;
  wire [19 : 0] \dc/clk_ticker/count ;
  wire [0 : 0] \dc/clk_ticker/Mcount_count_lut ;
  wire [18 : 0] \dc/clk_ticker/Mcount_count_cy ;
  wire [19 : 19] \dc/clk_ticker/tick ;
  GND   XST_GND (
    .G(cathode_2_OBUF_12)
  );
  VCC   XST_VCC (
    .P(cathode_6_OBUF_11)
  );
  FDC   \aiso/regOk/q  (
    .C(clk_BUFGP_1),
    .CLR(resetmeta_IBUF_0),
    .D(\aiso/regMeta/q_14 ),
    .Q(\aiso/regOk/q_13 )
  );
  FDC   \aiso/regMeta/q  (
    .C(clk_BUFGP_1),
    .CLR(resetmeta_IBUF_0),
    .D(cathode_6_OBUF_11),
    .Q(\aiso/regMeta/q_14 )
  );
  FDC   \dc/clk_ticker/count_0  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_0 ),
    .Q(\dc/clk_ticker/count [0])
  );
  FDC   \dc/clk_ticker/count_1  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_1 ),
    .Q(\dc/clk_ticker/count [1])
  );
  FDC   \dc/clk_ticker/count_2  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_2 ),
    .Q(\dc/clk_ticker/count [2])
  );
  FDC   \dc/clk_ticker/count_3  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_3 ),
    .Q(\dc/clk_ticker/count [3])
  );
  FDC   \dc/clk_ticker/count_4  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_4 ),
    .Q(\dc/clk_ticker/count [4])
  );
  FDC   \dc/clk_ticker/count_5  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_5 ),
    .Q(\dc/clk_ticker/count [5])
  );
  FDC   \dc/clk_ticker/count_6  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_6 ),
    .Q(\dc/clk_ticker/count [6])
  );
  FDC   \dc/clk_ticker/count_7  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_7 ),
    .Q(\dc/clk_ticker/count [7])
  );
  FDC   \dc/clk_ticker/count_8  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_8 ),
    .Q(\dc/clk_ticker/count [8])
  );
  FDC   \dc/clk_ticker/count_9  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_9 ),
    .Q(\dc/clk_ticker/count [9])
  );
  FDC   \dc/clk_ticker/count_10  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_10 ),
    .Q(\dc/clk_ticker/count [10])
  );
  FDC   \dc/clk_ticker/count_11  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_11 ),
    .Q(\dc/clk_ticker/count [11])
  );
  FDC   \dc/clk_ticker/count_12  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_12 ),
    .Q(\dc/clk_ticker/count [12])
  );
  FDC   \dc/clk_ticker/count_13  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_13 ),
    .Q(\dc/clk_ticker/count [13])
  );
  FDC   \dc/clk_ticker/count_14  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_14 ),
    .Q(\dc/clk_ticker/count [14])
  );
  FDC   \dc/clk_ticker/count_15  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_15 ),
    .Q(\dc/clk_ticker/count [15])
  );
  FDC   \dc/clk_ticker/count_16  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_16 ),
    .Q(\dc/clk_ticker/count [16])
  );
  FDC   \dc/clk_ticker/count_17  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_17 ),
    .Q(\dc/clk_ticker/count [17])
  );
  FDC   \dc/clk_ticker/count_18  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_18 ),
    .Q(\dc/clk_ticker/count [18])
  );
  FDC   \dc/clk_ticker/count_19  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/clk_ticker/Mcount_count_eqn_19 ),
    .Q(\dc/clk_ticker/count [19])
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<0>  (
    .CI(cathode_2_OBUF_12),
    .DI(cathode_6_OBUF_11),
    .S(\dc/clk_ticker/Mcount_count_lut [0]),
    .O(\dc/clk_ticker/Mcount_count_cy [0])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<0>  (
    .CI(cathode_2_OBUF_12),
    .LI(\dc/clk_ticker/Mcount_count_lut [0]),
    .O(\Result<0>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<1>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [0]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<1>_rt_122 ),
    .O(\dc/clk_ticker/Mcount_count_cy [1])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<1>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [0]),
    .LI(\dc/clk_ticker/Mcount_count_cy<1>_rt_122 ),
    .O(\Result<1>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<2>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [1]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<2>_rt_123 ),
    .O(\dc/clk_ticker/Mcount_count_cy [2])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<2>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [1]),
    .LI(\dc/clk_ticker/Mcount_count_cy<2>_rt_123 ),
    .O(\Result<2>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<3>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [2]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<3>_rt_124 ),
    .O(\dc/clk_ticker/Mcount_count_cy [3])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<3>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [2]),
    .LI(\dc/clk_ticker/Mcount_count_cy<3>_rt_124 ),
    .O(\Result<3>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<4>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [3]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<4>_rt_125 ),
    .O(\dc/clk_ticker/Mcount_count_cy [4])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<4>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [3]),
    .LI(\dc/clk_ticker/Mcount_count_cy<4>_rt_125 ),
    .O(\Result<4>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<5>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [4]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<5>_rt_126 ),
    .O(\dc/clk_ticker/Mcount_count_cy [5])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<5>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [4]),
    .LI(\dc/clk_ticker/Mcount_count_cy<5>_rt_126 ),
    .O(\Result<5>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<6>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [5]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<6>_rt_127 ),
    .O(\dc/clk_ticker/Mcount_count_cy [6])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<6>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [5]),
    .LI(\dc/clk_ticker/Mcount_count_cy<6>_rt_127 ),
    .O(\Result<6>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<7>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [6]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<7>_rt_128 ),
    .O(\dc/clk_ticker/Mcount_count_cy [7])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<7>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [6]),
    .LI(\dc/clk_ticker/Mcount_count_cy<7>_rt_128 ),
    .O(\Result<7>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<8>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [7]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<8>_rt_129 ),
    .O(\dc/clk_ticker/Mcount_count_cy [8])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<8>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [7]),
    .LI(\dc/clk_ticker/Mcount_count_cy<8>_rt_129 ),
    .O(\Result<8>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<9>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [8]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<9>_rt_130 ),
    .O(\dc/clk_ticker/Mcount_count_cy [9])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<9>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [8]),
    .LI(\dc/clk_ticker/Mcount_count_cy<9>_rt_130 ),
    .O(\Result<9>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<10>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [9]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<10>_rt_131 ),
    .O(\dc/clk_ticker/Mcount_count_cy [10])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<10>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [9]),
    .LI(\dc/clk_ticker/Mcount_count_cy<10>_rt_131 ),
    .O(\Result<10>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<11>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [10]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<11>_rt_132 ),
    .O(\dc/clk_ticker/Mcount_count_cy [11])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<11>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [10]),
    .LI(\dc/clk_ticker/Mcount_count_cy<11>_rt_132 ),
    .O(\Result<11>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<12>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [11]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<12>_rt_133 ),
    .O(\dc/clk_ticker/Mcount_count_cy [12])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<12>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [11]),
    .LI(\dc/clk_ticker/Mcount_count_cy<12>_rt_133 ),
    .O(\Result<12>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<13>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [12]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<13>_rt_134 ),
    .O(\dc/clk_ticker/Mcount_count_cy [13])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<13>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [12]),
    .LI(\dc/clk_ticker/Mcount_count_cy<13>_rt_134 ),
    .O(\Result<13>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<14>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [13]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<14>_rt_135 ),
    .O(\dc/clk_ticker/Mcount_count_cy [14])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<14>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [13]),
    .LI(\dc/clk_ticker/Mcount_count_cy<14>_rt_135 ),
    .O(\Result<14>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<15>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [14]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<15>_rt_136 ),
    .O(\dc/clk_ticker/Mcount_count_cy [15])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<15>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [14]),
    .LI(\dc/clk_ticker/Mcount_count_cy<15>_rt_136 ),
    .O(\Result<15>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<16>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [15]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<16>_rt_137 ),
    .O(\dc/clk_ticker/Mcount_count_cy [16])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<16>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [15]),
    .LI(\dc/clk_ticker/Mcount_count_cy<16>_rt_137 ),
    .O(\Result<16>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<17>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [16]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<17>_rt_138 ),
    .O(\dc/clk_ticker/Mcount_count_cy [17])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<17>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [16]),
    .LI(\dc/clk_ticker/Mcount_count_cy<17>_rt_138 ),
    .O(\Result<17>2 )
  );
  MUXCY   \dc/clk_ticker/Mcount_count_cy<18>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [17]),
    .DI(cathode_2_OBUF_12),
    .S(\dc/clk_ticker/Mcount_count_cy<18>_rt_139 ),
    .O(\dc/clk_ticker/Mcount_count_cy [18])
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<18>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [17]),
    .LI(\dc/clk_ticker/Mcount_count_cy<18>_rt_139 ),
    .O(\Result<18>2 )
  );
  XORCY   \dc/clk_ticker/Mcount_count_xor<19>  (
    .CI(\dc/clk_ticker/Mcount_count_cy [18]),
    .LI(\dc/clk_ticker/Mcount_count_xor<19>_rt_140 ),
    .O(\Result<19>2 )
  );
  FDC   \dc/pix_con/present_state_FSM_FFd2  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/pix_con/present_state_FSM_FFd2-In ),
    .Q(\dc/pix_con/present_state_FSM_FFd2_16 )
  );
  FDC   \dc/pix_con/present_state_FSM_FFd3  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/pix_con/present_state_FSM_FFd3-In ),
    .Q(\dc/pix_con/present_state_FSM_FFd3_15 )
  );
  FDC   \dc/pix_con/present_state_FSM_FFd1  (
    .C(clk_BUFGP_1),
    .CLR(reset),
    .D(\dc/pix_con/present_state_FSM_FFd1-In ),
    .Q(\dc/pix_con/present_state_FSM_FFd1_17 )
  );
  FDPE   \dc/pix_con/present_out_7  (
    .C(clk_BUFGP_1),
    .CE(\dc/clk_ticker/tick<19>1_103 ),
    .D(\dc/pix_con/present_out_7_dpot_149 ),
    .PRE(reset),
    .Q(\dc/pix_con/present_out [7])
  );
  FDPE   \dc/pix_con/present_out_6  (
    .C(clk_BUFGP_1),
    .CE(\dc/clk_ticker/tick<19>1_103 ),
    .D(\dc/pix_con/present_out_6_dpot_148 ),
    .PRE(reset),
    .Q(\dc/pix_con/present_out [6])
  );
  FDPE   \dc/pix_con/present_out_5  (
    .C(clk_BUFGP_1),
    .CE(\dc/clk_ticker/tick<19>1_103 ),
    .D(\dc/pix_con/present_out_5_dpot_147 ),
    .PRE(reset),
    .Q(\dc/pix_con/present_out [5])
  );
  FDPE   \dc/pix_con/present_out_4  (
    .C(clk_BUFGP_1),
    .CE(\dc/clk_ticker/tick<19>1_103 ),
    .D(\dc/pix_con/present_out_4_dpot_146 ),
    .PRE(reset),
    .Q(\dc/pix_con/present_out [4])
  );
  FDPE   \dc/pix_con/present_out_3  (
    .C(clk_BUFGP_1),
    .CE(\dc/clk_ticker/tick<19>1_103 ),
    .D(\dc/pix_con/present_out_3_dpot_145 ),
    .PRE(reset),
    .Q(\dc/pix_con/present_out [3])
  );
  FDPE   \dc/pix_con/present_out_2  (
    .C(clk_BUFGP_1),
    .CE(\dc/clk_ticker/tick<19>1_103 ),
    .D(\dc/pix_con/present_out_2_dpot_144 ),
    .PRE(reset),
    .Q(\dc/pix_con/present_out [2])
  );
  FDPE   \dc/pix_con/present_out_1  (
    .C(clk_BUFGP_1),
    .CE(\dc/clk_ticker/tick<19>1_103 ),
    .D(\dc/pix_con/present_out_1_dpot_143 ),
    .PRE(reset),
    .Q(\dc/pix_con/present_out [1])
  );
  FDPE   \dc/pix_con/present_out_0  (
    .C(clk_BUFGP_1),
    .CE(\dc/clk_ticker/tick<19>1_103 ),
    .D(\dc/pix_con/present_out_0_dpot_142 ),
    .PRE(reset),
    .Q(\dc/pix_con/present_out [0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_01  (
    .I0(\Result<0>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_0 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_110  (
    .I0(\Result<1>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_1 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_21  (
    .I0(\Result<2>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_2 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_31  (
    .I0(\Result<3>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_3 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_41  (
    .I0(\Result<4>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_4 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_51  (
    .I0(\Result<5>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_5 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_61  (
    .I0(\Result<6>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_6 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_71  (
    .I0(\Result<7>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_7 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_81  (
    .I0(\Result<8>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_8 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_91  (
    .I0(\Result<9>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_9 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_101  (
    .I0(\Result<10>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_10 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_111  (
    .I0(\Result<11>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_11 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_121  (
    .I0(\Result<12>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_12 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_131  (
    .I0(\Result<13>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_13 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_141  (
    .I0(\Result<14>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_14 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_151  (
    .I0(\Result<15>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_15 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_161  (
    .I0(\Result<16>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_16 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_171  (
    .I0(\Result<17>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_17 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \dc/clk_ticker/Mcount_count_eqn_181  (
    .I0(\Result<18>2 ),
    .I1(\dc/tick ),
    .O(\dc/clk_ticker/Mcount_count_eqn_18 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \dc/clk_ticker/Mcount_count_eqn_191  (
    .I0(\dc/tick ),
    .I1(\Result<19>2 ),
    .O(\dc/clk_ticker/Mcount_count_eqn_19 )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \dc/pix_con/present_state_FSM_FFd2-In1  (
    .I0(\dc/pix_con/present_state_FSM_FFd2_16 ),
    .I1(\dc/pix_con/present_state_FSM_FFd3_15 ),
    .I2(\dc/tick ),
    .O(\dc/pix_con/present_state_FSM_FFd2-In )
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \dc/pix_con/present_state_FSM_FFd1-In1  (
    .I0(\dc/pix_con/present_state_FSM_FFd1_17 ),
    .I1(\dc/pix_con/present_state_FSM_FFd3_15 ),
    .I2(\dc/pix_con/present_state_FSM_FFd2_16 ),
    .I3(\dc/tick ),
    .O(\dc/pix_con/present_state_FSM_FFd1-In )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \dc/pix_con/present_state_FSM_FFd3-In1  (
    .I0(\dc/pix_con/present_state_FSM_FFd3_15 ),
    .I1(\dc/tick ),
    .O(\dc/pix_con/present_state_FSM_FFd3-In )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \dc/clk_ticker/tick<19>1  (
    .I0(\dc/clk_ticker/count [1]),
    .I1(\dc/clk_ticker/count [0]),
    .I2(\dc/clk_ticker/count [2]),
    .I3(\dc/clk_ticker/count [3]),
    .I4(\dc/clk_ticker/count [4]),
    .I5(\dc/clk_ticker/count [5]),
    .O(\dc/clk_ticker/tick [19])
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \dc/clk_ticker/tick<19>2  (
    .I0(\dc/clk_ticker/count [16]),
    .I1(\dc/clk_ticker/count [14]),
    .I2(\dc/clk_ticker/count [19]),
    .I3(\dc/clk_ticker/count [18]),
    .I4(\dc/clk_ticker/count [17]),
    .O(\dc/clk_ticker/tick<19>1_103 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \dc/clk_ticker/tick<19>3  (
    .I0(\dc/clk_ticker/count [8]),
    .I1(\dc/clk_ticker/count [7]),
    .I2(\dc/clk_ticker/count [10]),
    .I3(\dc/clk_ticker/count [11]),
    .I4(\dc/clk_ticker/count [12]),
    .I5(\dc/clk_ticker/count [13]),
    .O(\dc/clk_ticker/tick<19>2_104 )
  );
  LUT6 #(
    .INIT ( 64'h4000000000000000 ))
  \dc/clk_ticker/tick<19>4  (
    .I0(\dc/clk_ticker/count [15]),
    .I1(\dc/clk_ticker/count [6]),
    .I2(\dc/clk_ticker/count [9]),
    .I3(\dc/clk_ticker/tick<19>2_104 ),
    .I4(\dc/clk_ticker/tick [19]),
    .I5(\dc/clk_ticker/tick<19>1_103 ),
    .O(\dc/tick )
  );
  IBUF   resetmeta_IBUF (
    .I(resetmeta),
    .O(resetmeta_IBUF_0)
  );
  OBUF   anode_7_OBUF (
    .I(\dc/pix_con/present_out [7]),
    .O(anode[7])
  );
  OBUF   anode_6_OBUF (
    .I(\dc/pix_con/present_out [6]),
    .O(anode[6])
  );
  OBUF   anode_5_OBUF (
    .I(\dc/pix_con/present_out [5]),
    .O(anode[5])
  );
  OBUF   anode_4_OBUF (
    .I(\dc/pix_con/present_out [4]),
    .O(anode[4])
  );
  OBUF   anode_3_OBUF (
    .I(\dc/pix_con/present_out [3]),
    .O(anode[3])
  );
  OBUF   anode_2_OBUF (
    .I(\dc/pix_con/present_out [2]),
    .O(anode[2])
  );
  OBUF   anode_1_OBUF (
    .I(\dc/pix_con/present_out [1]),
    .O(anode[1])
  );
  OBUF   anode_0_OBUF (
    .I(\dc/pix_con/present_out [0]),
    .O(anode[0])
  );
  OBUF   cathode_6_OBUF (
    .I(cathode_6_OBUF_11),
    .O(cathode[6])
  );
  OBUF   cathode_5_OBUF (
    .I(cathode_2_OBUF_12),
    .O(cathode[5])
  );
  OBUF   cathode_4_OBUF (
    .I(cathode_2_OBUF_12),
    .O(cathode[4])
  );
  OBUF   cathode_3_OBUF (
    .I(cathode_2_OBUF_12),
    .O(cathode[3])
  );
  OBUF   cathode_2_OBUF (
    .I(cathode_2_OBUF_12),
    .O(cathode[2])
  );
  OBUF   cathode_1_OBUF (
    .I(cathode_2_OBUF_12),
    .O(cathode[1])
  );
  OBUF   cathode_0_OBUF (
    .I(cathode_2_OBUF_12),
    .O(cathode[0])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<1>_rt  (
    .I0(\dc/clk_ticker/count [1]),
    .O(\dc/clk_ticker/Mcount_count_cy<1>_rt_122 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<2>_rt  (
    .I0(\dc/clk_ticker/count [2]),
    .O(\dc/clk_ticker/Mcount_count_cy<2>_rt_123 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<3>_rt  (
    .I0(\dc/clk_ticker/count [3]),
    .O(\dc/clk_ticker/Mcount_count_cy<3>_rt_124 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<4>_rt  (
    .I0(\dc/clk_ticker/count [4]),
    .O(\dc/clk_ticker/Mcount_count_cy<4>_rt_125 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<5>_rt  (
    .I0(\dc/clk_ticker/count [5]),
    .O(\dc/clk_ticker/Mcount_count_cy<5>_rt_126 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<6>_rt  (
    .I0(\dc/clk_ticker/count [6]),
    .O(\dc/clk_ticker/Mcount_count_cy<6>_rt_127 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<7>_rt  (
    .I0(\dc/clk_ticker/count [7]),
    .O(\dc/clk_ticker/Mcount_count_cy<7>_rt_128 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<8>_rt  (
    .I0(\dc/clk_ticker/count [8]),
    .O(\dc/clk_ticker/Mcount_count_cy<8>_rt_129 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<9>_rt  (
    .I0(\dc/clk_ticker/count [9]),
    .O(\dc/clk_ticker/Mcount_count_cy<9>_rt_130 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<10>_rt  (
    .I0(\dc/clk_ticker/count [10]),
    .O(\dc/clk_ticker/Mcount_count_cy<10>_rt_131 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<11>_rt  (
    .I0(\dc/clk_ticker/count [11]),
    .O(\dc/clk_ticker/Mcount_count_cy<11>_rt_132 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<12>_rt  (
    .I0(\dc/clk_ticker/count [12]),
    .O(\dc/clk_ticker/Mcount_count_cy<12>_rt_133 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<13>_rt  (
    .I0(\dc/clk_ticker/count [13]),
    .O(\dc/clk_ticker/Mcount_count_cy<13>_rt_134 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<14>_rt  (
    .I0(\dc/clk_ticker/count [14]),
    .O(\dc/clk_ticker/Mcount_count_cy<14>_rt_135 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<15>_rt  (
    .I0(\dc/clk_ticker/count [15]),
    .O(\dc/clk_ticker/Mcount_count_cy<15>_rt_136 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<16>_rt  (
    .I0(\dc/clk_ticker/count [16]),
    .O(\dc/clk_ticker/Mcount_count_cy<16>_rt_137 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<17>_rt  (
    .I0(\dc/clk_ticker/count [17]),
    .O(\dc/clk_ticker/Mcount_count_cy<17>_rt_138 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_cy<18>_rt  (
    .I0(\dc/clk_ticker/count [18]),
    .O(\dc/clk_ticker/Mcount_count_cy<18>_rt_139 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \dc/clk_ticker/Mcount_count_xor<19>_rt  (
    .I0(\dc/clk_ticker/count [19]),
    .O(\dc/clk_ticker/Mcount_count_xor<19>_rt_140 )
  );
  LUT5 #(
    .INIT ( 32'h40000000 ))
  \dc/clk_ticker/tick<19>4_rstpot  (
    .I0(\dc/clk_ticker/count [15]),
    .I1(\dc/clk_ticker/count [6]),
    .I2(\dc/clk_ticker/count [9]),
    .I3(\dc/clk_ticker/tick<19>2_104 ),
    .I4(\dc/clk_ticker/tick [19]),
    .O(\dc/clk_ticker/tick<19>4_rstpot_141 )
  );
  LUT5 #(
    .INIT ( 32'h3FFFAAAA ))
  \dc/pix_con/present_out_0_dpot  (
    .I0(\dc/pix_con/present_out [0]),
    .I1(\dc/pix_con/present_state_FSM_FFd1_17 ),
    .I2(\dc/pix_con/present_state_FSM_FFd2_16 ),
    .I3(\dc/pix_con/present_state_FSM_FFd3_15 ),
    .I4(\dc/clk_ticker/tick<19>4_rstpot_141 ),
    .O(\dc/pix_con/present_out_0_dpot_142 )
  );
  LUT5 #(
    .INIT ( 32'hFFFCAAAA ))
  \dc/pix_con/present_out_1_dpot  (
    .I0(\dc/pix_con/present_out [1]),
    .I1(\dc/pix_con/present_state_FSM_FFd1_17 ),
    .I2(\dc/pix_con/present_state_FSM_FFd2_16 ),
    .I3(\dc/pix_con/present_state_FSM_FFd3_15 ),
    .I4(\dc/clk_ticker/tick<19>4_rstpot_141 ),
    .O(\dc/pix_con/present_out_1_dpot_143 )
  );
  LUT5 #(
    .INIT ( 32'hFCFFAAAA ))
  \dc/pix_con/present_out_2_dpot  (
    .I0(\dc/pix_con/present_out [2]),
    .I1(\dc/pix_con/present_state_FSM_FFd1_17 ),
    .I2(\dc/pix_con/present_state_FSM_FFd2_16 ),
    .I3(\dc/pix_con/present_state_FSM_FFd3_15 ),
    .I4(\dc/clk_ticker/tick<19>4_rstpot_141 ),
    .O(\dc/pix_con/present_out_2_dpot_144 )
  );
  LUT5 #(
    .INIT ( 32'hFFCFAAAA ))
  \dc/pix_con/present_out_3_dpot  (
    .I0(\dc/pix_con/present_out [3]),
    .I1(\dc/pix_con/present_state_FSM_FFd1_17 ),
    .I2(\dc/pix_con/present_state_FSM_FFd2_16 ),
    .I3(\dc/pix_con/present_state_FSM_FFd3_15 ),
    .I4(\dc/clk_ticker/tick<19>4_rstpot_141 ),
    .O(\dc/pix_con/present_out_3_dpot_145 )
  );
  LUT5 #(
    .INIT ( 32'hCFFFAAAA ))
  \dc/pix_con/present_out_4_dpot  (
    .I0(\dc/pix_con/present_out [4]),
    .I1(\dc/pix_con/present_state_FSM_FFd1_17 ),
    .I2(\dc/pix_con/present_state_FSM_FFd2_16 ),
    .I3(\dc/pix_con/present_state_FSM_FFd3_15 ),
    .I4(\dc/clk_ticker/tick<19>4_rstpot_141 ),
    .O(\dc/pix_con/present_out_4_dpot_146 )
  );
  LUT5 #(
    .INIT ( 32'hFFF3AAAA ))
  \dc/pix_con/present_out_5_dpot  (
    .I0(\dc/pix_con/present_out [5]),
    .I1(\dc/pix_con/present_state_FSM_FFd1_17 ),
    .I2(\dc/pix_con/present_state_FSM_FFd2_16 ),
    .I3(\dc/pix_con/present_state_FSM_FFd3_15 ),
    .I4(\dc/clk_ticker/tick<19>4_rstpot_141 ),
    .O(\dc/pix_con/present_out_5_dpot_147 )
  );
  LUT5 #(
    .INIT ( 32'hF3FFAAAA ))
  \dc/pix_con/present_out_6_dpot  (
    .I0(\dc/pix_con/present_out [6]),
    .I1(\dc/pix_con/present_state_FSM_FFd1_17 ),
    .I2(\dc/pix_con/present_state_FSM_FFd2_16 ),
    .I3(\dc/pix_con/present_state_FSM_FFd3_15 ),
    .I4(\dc/clk_ticker/tick<19>4_rstpot_141 ),
    .O(\dc/pix_con/present_out_6_dpot_148 )
  );
  LUT5 #(
    .INIT ( 32'hFF3FAAAA ))
  \dc/pix_con/present_out_7_dpot  (
    .I0(\dc/pix_con/present_out [7]),
    .I1(\dc/pix_con/present_state_FSM_FFd1_17 ),
    .I2(\dc/pix_con/present_state_FSM_FFd2_16 ),
    .I3(\dc/pix_con/present_state_FSM_FFd3_15 ),
    .I4(\dc/clk_ticker/tick<19>4_rstpot_141 ),
    .O(\dc/pix_con/present_out_7_dpot_149 )
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_1)
  );
  INV   \dc/clk_ticker/Mcount_count_lut<0>_INV_0  (
    .I(\dc/clk_ticker/count [0]),
    .O(\dc/clk_ticker/Mcount_count_lut [0])
  );
  INV   \aiso/resetout1_INV_0  (
    .I(\aiso/regOk/q_13 ),
    .O(reset)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

