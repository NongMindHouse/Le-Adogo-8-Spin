`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:50:15 11/28/2023 
// Design Name: 
// Module Name:    counter 
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
module counter(clk,
					reset,
					counter
    );

	input clk;
	input reset;
	output reg [9:0] counter = 10'b0000000000;
	
   always @(posedge clk or negedge reset) begin
       if(~reset) begin 
           counter <= 0;
       end
       else begin
           counter <= counter+1; 
       end
   end

endmodule
