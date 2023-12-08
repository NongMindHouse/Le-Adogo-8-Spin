`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:29 12/01/2023 
// Design Name: 
// Module Name:    divBulletClk 
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
module divBulletClk(clk_in,
						clk_out
    );
	input clk_in;
	output reg clk_out;
	
	reg [31:0]counter; 
	 
	initial begin 
		counter <= 0;
		clk_out <= 0;
	end

	always @(posedge clk_in) begin 
		if(counter == 75)begin 
			counter <= 0;
			clk_out <= ~clk_out;
		end
		else begin 
			counter <= counter + 1'b1;
		end
	end

endmodule

