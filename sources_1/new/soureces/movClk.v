`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:42 12/01/2023 
// Design Name: 
// Module Name:    movClk 
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
module movClk(clkIn,
              reset,
			  clkOut
    );
    input clkIn;
    input reset;
    output reg clkOut = 0 ;
    reg [31:0] counter = 0;
    
    always @(posedge clkIn or negedge reset) begin
        if(~reset) begin
            clkOut <= 0;
            counter <= 0;
        end else
            if(counter == 50) begin
                counter <= 0;
                clkOut <= ~clkOut;
            end 
            else
                counter <= counter + 1'b1;
    end

endmodule
