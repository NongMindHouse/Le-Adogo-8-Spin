`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:25:49 11/30/2023 
// Design Name: 
// Module Name:    movePlayer 
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
module movePlayer(pbR,
						pbL,
						clk,
						reset,
						playerpos
    );
	 
	input pbR;
	input pbL;
	input clk;
	input reset;
	output [9:0] playerpos;
	wire [1:0] counterControl;
	
counterControl u0 (.pbR(pbR),
						 .pbL(pbL),
						 .cntVal(playerpos),
						 .controlSignal(counterControl)
    );
	 
moveCounter u1 (.ctrl(counterControl),
					 .clk(clk), 
					 .cntVal(playerpos),
					 .reset(reset)
    );
	 
endmodule
