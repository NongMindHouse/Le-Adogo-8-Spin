`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:11:22 12/01/2023 
// Design Name: 
// Module Name:    bulletCounter 
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
module bulletCounter(enb,
							clk,
							reset,
							bulletPosY
    );

	input enb;
	input clk; 
	input reset;
	output reg [9:0] bulletPosY = 400;
	
	always @(posedge clk or negedge enb or negedge reset) begin 
		if(~reset)
			bulletPosY <= 400;
		else if(~enb) begin 
			bulletPosY <= 400;
		end 
		else
			bulletPosY <= bulletPosY - 1'b1;
	end

endmodule
