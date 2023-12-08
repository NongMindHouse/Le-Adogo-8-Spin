`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:31:42 11/30/2023 
// Design Name: 
// Module Name:    moveCounter 
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
module moveCounter(ctrl,
						 clk, 
						 reset,
						 cntVal
    );
	 
	input [1:0] ctrl;
	input clk;
	input reset;
	output reg [9:0] cntVal = 319;
	
	localparam movL = 2'b00;
	localparam movR = 2'b01;
	
	always @(posedge clk or negedge reset) begin
		if(~reset)begin 
			cntVal <= 319;
		end
		else begin
			case (ctrl) 
				movL : cntVal <= cntVal - 1'b1;
				movR : cntVal <= cntVal + 1'b1;
				default : cntVal <= cntVal;
			endcase
		end
	end
endmodule
