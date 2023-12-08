`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:05:07 11/28/2023 
// Design Name: 
// Module Name:    horzSignalGenerator 
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
module horzSignalGenerator(counter,
									hsync,
									horzReset,
									verticalGate,
									active
    );
	 
	input [9:0] counter;
	output reg hsync = 1;
	output reg horzReset = 1;
	output reg verticalGate = 0;
	output reg active = 0;
	
	always @(counter) begin 
		horzReset <= (counter == 800) ? 0 : 1;
		verticalGate <= (counter == 800) ? 1 : 0;
		hsync <= (counter >= 656 && counter <= 751) ? 0 : 1;
		active <= (counter <= 639) ? 1:0;
	end

endmodule
