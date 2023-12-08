`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:53 11/28/2023 
// Design Name: 
// Module Name:    vertSignalGenerator 
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
module vertSignalGenerator(counter,
									vsync,
									vertReset,
									active
    );

	input [9:0] counter;
	output reg vsync = 1;
	output reg vertReset = 1;
	output reg active = 0; 
	
   always @(counter) begin 
        vertReset <= (counter == 525) ? 0 : 1;
        vsync <= (counter == 490 || counter == 491) ? 0:1;
        active <= (counter <= 479) ? 1:0;
    end
endmodule
