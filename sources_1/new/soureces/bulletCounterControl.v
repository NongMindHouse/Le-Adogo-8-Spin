`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:44:34 12/01/2023 
// Design Name: 
// Module Name:    bulletCounterControl 
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
module bulletCounterControl(bulletPosY,
									 pbG,
									 collision,
									 enb
    );

	input [9:0] bulletPosY;
	input pbG;
	input collision;
	output reg enb = 0;
	
	always @(bulletPosY or collision or pbG) begin 
		if(collision == 1 || bulletPosY == 40) begin 
			enb <= 0;
		end
		else if (~pbG) begin 
			enb <= 1;
		end
	end

endmodule
