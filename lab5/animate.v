`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:31 05/02/2018 
// Design Name: 
// Module Name:    animate 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 _ File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module animate(clk, reset, video_on, btn, pix_x, pix_y, graph_rgb);

input clk, reset;
input video_on;
input [1:0] btn;
input [9:0] pix_x , pix_y;
output reg [2:0] graph_rgb;

// c o n s t a n t and s i g n a l d e c l a r a t i o n
// x , y c o o r d i n a t e s (0,O) t o ( 6 3 9 , 4 7 9 )
localparam MAX_X = 640;
localparam MAX_Y = 480;
wire refr_tick;

// v e r t i c a l s t r i p e a s a w a l l

// w a l l l e f t , r i g h t boundary
localparam WALL_X_L = 32;
localparam WALL_X_R = 35;
// r i g h t v e r t i c a l bar

// bar l e f t , r i g h t boundary
localparam BAR_X_L = 600;
localparam BAR_X_R = 603;

// bar t o p , bottom boundary
wire [9:0] bar_y_t, bar_y_b;
localparam BAR_Y_SIZE = 72;

// reg i s t e r t o t r a c k t o p boundary ( x p o s i t i o n i s f i x e d )
reg [9:0] bar_y_reg, bar_y_next;

// bar moving v e l o c i t y when a b u t t o n i s p r e s s e d
localparam BAR_V = 4;

// square ball
localparam BALL_SIZE = 8;

// ball l e f t , r i g h t boundary
wire [9:0] ball_x_l, ball_x_r;

// ball t o p , bottom boundary
wire [9:0] ball_y_t, ball_y_b;

// reg t o t r a c k l e f t , t o p p o s i t i o n
reg [9:0] ball_x_reg, ball_y_reg ;
wire [9:0] ball_x_next, ball_y_next ;

// reg t o t r a c k ball speed
reg [9:0] x_delta_reg, x_delta_next;
reg [9:0] y_delta_reg, y_delta_next;

// ball v e l o c i t y can be pos or n e g )
localparam BALL_V_P = 2;
localparam BALL_V_N = -2;

// round ball
wire [2:0] rom_addr, rom_col;
reg [7:0] rom_data;
wire rom_bit;

// o b j e c t o u t p u t s i g n a l s
wire wall_on, bar_on, sq_ball_on, rd_ball_on;
wire [2:0] wall_rgb, bar_rgb, ball_rgb;

// round ball image ROM
always @ (*)
   
	case(rom_addr)
      3'h0: rom_data = 8'b00111100; //   ****
      3'h1: rom_data = 8'b01111110; //  ******
      3'h2: rom_data = 8'b11111111; // ********
      3'h3: rom_data = 8'b11111111; // ********
      3'h4: rom_data = 8'b11111111; // ********
      3'h5: rom_data = 8'b11111111; // ********
      3'h6: rom_data = 8'b01111110; //  ******
      3'h7: rom_data = 8'b00111100; //   ****
   endcase

// reg i s t e r s
always @( posedge clk, posedge reset )

   if(reset)
   begin
   
	   bar_y_reg <= 0;
      ball_x_reg <= 0;
      ball_y_reg <= 0;
      x_delta_reg <= 10'h004;
      y_delta_reg <= 10'h004;

   end

else
   begin
      
		bar_y_reg <= bar_y_next ;
      ball_x_reg <= ball_x_next ;
      ball_y_reg <= ball_y_next ;
      x_delta_reg <= x_delta_next ;
      y_delta_reg <= y_delta_next ;
   
	end

// refr_tick: I _ c l o c k t i c k a s s e r t e d a t s t a r t o f v_sync
// i.e. when t h e s c r e e n i s r e f r e s h e d ( 6 0 H z )
assign refr_tick = (pix_y==481) && (pix_x==0);

// (wall) l e f t v e r t i c a l s t r i p
// p i x e l w i t h i n w a l l
assign wall_on = (WALL_X_L <= pix_x) && ( pix_x <= WALL_X_R) ;

// w a l l rgb o u t p u t
assign wall_rgb = 3'b001; // blue

// r i g h t v e r t i c a l bar
// boundary
assign bar_y_t = bar_y_reg;
assign bar_y_b = bar_y_t + BAR_Y_SIZE - 1;

// p i x e l w i t h i n bar
assign bar_on = (BAR_X_L <= pix_x) && (pix_x <= BAR_X_R) &&
(bar_y_t <= pix_y) && ( pix_y <= bar_y_b) ;

// bar rgb o u t p u t
assign bar_rgb = 3'b010; // green

// new bar y _ p o s i t i o n
always @ (*)
begin

   bar_y_next = bar_y_reg; // no move

   if(refr_tick)
      if(btn[1] & ( bar_y_b < (MAX_Y - 1 - BAR_V)))
         bar_y_next = bar_y_reg + BAR_V; // move down
      else if (btn[0] & ( bar_y_t > BAR_V))
         bar_y_next = bar_y_reg - BAR_V; // move up

end

// square ball
// boundary
assign ball_x_l = ball_x_reg;
assign ball_y_t = ball_y_reg;
assign ball_x_r = ball_x_1 + BALL_SIZE_1;
assign ball_y_b = ball_y_t + BALL_SIZE_1;

// p i x e l w i t h i n ball
assign sq_ball_on = (ball_x_1 <= pix_x) && ( pix_x <= ball_x_r) && (ball_y_t <= pix_y) && ( pix_y <= ball_y_b);

// map c u r r e n t p i x e l l o c a t i o n t o ROM addr/col
assign rom_addr = pix_y [2:0] - ball_y_t [2:0];
assign rom_col = pix_x [2:0] - ball_x_1 [2:0];
assign rom_bit = rom_data [rom_col];

// p i x e l w i t h i n ball
assign rd_ball_on = sq_ball_on & rom_bit;

// ball rgb o u t p u t
assign ball_rgb = 3'b100; // r e d

// new ball p o s i t i o n
assign ball_x_next = (refr_tick) ? ball_x_reg + x_delta_reg : ball_x_reg ;
assign ball_y_next = (refr_tick) ? ball_y_reg + y_delta_reg : ball_y_reg ;

// new ball v e l o c i t y
always @ (*)
begin

   y_delta_next = y_delta_reg;

   if(ball_y_t < 1) // reach t o p
      y_delta_next = BALL_V_P;
   else if(ball_y_b > (MAX_Y_1)) // reach bottom
      y_delta_next = BALL_V_N;
   else if (ball_x_1 <= WALL_X_R) // reach w a l l
      x_delta_next = BALL_V_P; // bounce back
   else if ( (BAR_X_L <=ball_x_r ) && (ball_x_r <=BAR_X_R) &&
      (bar_y_t <=ball_y_b) && (ball_y_t <=bar_y_b))

   // reach x o f r i g h t bar and h i t , ball bounce back
   x_delta_next = BALL_V_N;

end

// rgb m u l t i p l e x i n g c i r c u i t
always @ (*)

   if(video_on)
      graph_rgb = 3'b000; // blank
   else if(wall_on)
      graph_rgb = wall_rgb ;
   else if(bar_on)
      graph_rgb = bar_rgb ;
   else if(rd_ball_on)
      graph_rgb = ball_rgb ;
   else
      graph_rgb = 3'b110; // y e l l o w background

endmodule
