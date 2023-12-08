`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:43:43 11/30/2023 
// Design Name: 
// Module Name:    counterControl 
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
module counterControl(pbR,
							 pbL,
							 cntVal,
							 controlSignal
    );
	input pbR;
	input pbL;
	input [9:0] cntVal;
	output reg [1:0] controlSignal = 2'b10;
	
	always @(pbR or pbL or cntVal) begin 
		if(pbL == 0 && cntVal > 15 && pbR == 1)
			controlSignal <= 2'b00;
		else if(pbR == 0 && cntVal < 624 && pbL == 1)
			controlSignal <= 2'b01;
		else
			controlSignal <= 2'b10;
	end
endmodule
