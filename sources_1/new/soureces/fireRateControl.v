`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:44 12/02/2023 
// Design Name: 
// Module Name:    fireRateControl 
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
module fireRateControl(bulletPosY,
							  pbG,
							  enb
    );

	input [9:0] bulletPosY;
	input pbG;
	output reg enb = 0;
	
	always @(bulletPosY or pbG) begin 
		if(bulletPosY == 66) begin 
			enb <= 0;
		end
		else if (~pbG) begin 
			enb <= 1;
		end
	end

endmodule
