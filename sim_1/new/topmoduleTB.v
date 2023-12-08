`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 01:55:31 PM
// Design Name: 
// Module Name: topmoduleTB
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


module topmoduleTB();
    reg clk = 0; 
    reg pbR = 1;
    reg pbL = 1;
    reg pbG = 1;
    reg reset = 0;
    wire hSync; 
    wire vSync;
    
    wire [1:0] vgaRed;
    wire [1:0] vgaGreen;
    wire [1:0] vgaBlue;
    always begin 
        #5; 
        clk = ~clk;
    end
    topModule dut(.CLK100MHZ(clk),
                  .pbR(pbR),
                  .pbL(pbL),
                  .pbG(pbG),
                  .vgaRed(vgaRed),
                  .vgaGreen(vgaGreen),
                  .vgaBlue(vgaBlue),
                  .hSync(hSync),
                  .vSync(vSync),
                  .gameReset(reset));
   initial begin 
        #5;
        pbG = 0;
        #5;
        pbG = 1;
   end
endmodule
