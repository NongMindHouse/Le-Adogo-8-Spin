`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 10:18:29 PM
// Design Name: 
// Module Name: 7seg
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


module seg(
    input clk,
    input [3:0] score,
    input reset,
    output reg [6:0] seg,
    output reg [3:0] an = 4'b0000
    );
    wire slowclk;
    reg selector = 1'b0;
    always @(selector) begin
        if(selector) begin 
            an <= 4'b1110;
            case(score % 10)
                4'b0000: seg = 7'b1000000;
                4'b0001: seg = 7'b1111001;
                4'b0010: seg = 7'b0100100;
                4'b0011: seg = 7'b0110000;
                4'b0100: seg = 7'b0011001;
                4'b0101: seg = 7'b0010010;
                4'b0110: seg = 7'b0000010;
                4'b0111: seg = 7'b1111000;
                4'b1000: seg = 7'b0000000;
                4'b1001: seg = 7'b0010000;
                default: seg = 7'b1111111;
                endcase            
        end 
        else begin
            an <= 4'b1101;
            case(score / 10)
                4'b0000: seg = 7'b1000000;
                4'b0001: seg = 7'b1111001;
                4'b0010: seg = 7'b0100100;
                4'b0011: seg = 7'b0110000;
                4'b0100: seg = 7'b0011001;
                4'b0101: seg = 7'b0010010;
                4'b0110: seg = 7'b0000010;
                4'b0111: seg = 7'b1111000;
                4'b1000: seg = 7'b0000000;
                4'b1001: seg = 7'b0010000;
                default: seg = 7'b1111111;
            endcase 
        end 
    end
    segmentDiv u0 (.clk_in(clk),
                   .reset(reset),
                   .clk_out(slowclk)
        ); 
        
   always @(posedge slowclk or negedge reset) begin 
        if(~reset) begin
          selector <= 1'b0; 
        end
        else begin
            selector <= ~selector;
        end
   end   
endmodule
