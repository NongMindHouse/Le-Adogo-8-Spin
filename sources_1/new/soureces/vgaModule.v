`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:36:07 11/28/2023 
// Design Name: 
// Module Name:    vgaModule 
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
module vgaModule(clk,
					  rgbContent,
					  horCnt,
					  verCnt,
					  vgaRed,
					  vgaGreen,
					  vgaBlue,
					  hSync,
					  vSync,
					  sActive
    );
	input clk;
	input [5:0] rgbContent;
	output [9:0] horCnt;
	output [9:0] verCnt;
	output [1:0] vgaRed;
	output [1:0] vgaGreen; 
	output [1:0] vgaBlue;
	output hSync;
	output vSync;
	
	wire horzReset;
	wire vertReset;
	wire verticalGating;
	wire hActive;
	wire vActive;
	output sActive;

	counter horz(.clk(clk),
					 .reset(horzReset),
					 .counter(horCnt)
    );

	counter vert(.clk(verticalGating),
					 .reset(vertReset),
					 .counter(verCnt)
    );

	horzSignalGenerator u0 (.counter(horCnt),
									.hsync(hSync),
									.horzReset(horzReset),
									.verticalGate(verticalGating),
									.active(hActive)
    );

	vertSignalGenerator u1 (.counter(verCnt),
									.vsync(vSync),
									.vertReset(vertReset),
									.active(vActive)
    );	 
	 
	assign sActive = vActive & hActive;
	
	assign vgaRed[0] = rgbContent[0] & sActive;
	assign vgaRed[1] = rgbContent[1] & sActive;
	
	assign vgaGreen[0] = rgbContent[2] & sActive;
	assign vgaGreen[1] = rgbContent[3] & sActive;
	
	assign vgaBlue[0] = rgbContent[4] & sActive;
	assign vgaBlue[1] = rgbContent[5] & sActive;
	
endmodule
