`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 01:23:20 PM
// Design Name: 
// Module Name: debounceClk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debounceClk(clkIn,
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
            if(counter == 5) begin
                counter <= 0;
                clkOut <= ~clkOut;
            end 
            else
                counter <= counter + 1'b1;
    end

endmodule
