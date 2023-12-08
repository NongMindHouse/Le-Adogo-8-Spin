`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:43:38 11/29/2023 
// Design Name: 
// Module Name:    playerHandle 
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
module playerHandle(pbL,
						  pbR,
						  horCnt,
						  verCnt,
						  clk,
						  reset,
						  content,
						  playerPos
    );
	input pbL;
	input pbR;
	input [9:0] horCnt;
	input [9:0] verCnt;
	input clk;
	input reset;
	output [5:0] content;
	output [9:0] playerPos;
	
	
	drawPlayer u0 (.horCnt(horCnt),
						.verCnt(verCnt),
						.position(playerPos),
						.rgbContent(content)
    );
	 
	movePlayer u1 (.pbR(pbR),
						.pbL(pbL),
						.clk(clk),
						.playerpos(playerPos),
						.reset(reset)
    );
endmodule
