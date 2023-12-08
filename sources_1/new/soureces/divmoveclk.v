`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:10:20 11/27/2023 
// Design Name: 
// Module Name:    divmoveclk 
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
module divmoveclk(clk_in,
						reset,
						clk_out
    );
	input clk_in;
	input reset;
	output reg clk_out;
	
	reg [31:0]counter; 
	 
	initial begin 
		counter <= 0;
		clk_out <= 0;
	end

	always @(posedge clk_in or negedge reset) begin 
		if(~reset) 
			counter <= 0;
		else begin
			if(counter == 60)begin 
				counter <= 0;
				clk_out <= ~clk_out;
			end
			else begin 
				counter <= counter + 1'b1;
			end
		end
	end

endmodule
