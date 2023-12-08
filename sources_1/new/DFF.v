`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 01:36:02 PM
// Design Name: 
// Module Name: DFF
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


module DFF(clk,
            D,
            Q,
            reset);
    input clk;
    input D;
    input reset;
    output reg Q = 1'b1;
    
    always @(posedge clk or negedge reset) begin
        if(~reset) begin
            Q <= 1'b1;
        end 
        else begin
            Q <= D;
        end
    end
endmodule
