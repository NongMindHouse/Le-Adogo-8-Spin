`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 06:38:55 PM
// Design Name: 
// Module Name: drawenbTB
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


module drawenbTB(

    );
    integer i;
    integer j;
    reg [9:0] hor;
    reg [9:0] ver;
    reg [9:0] pX;
    reg [9:0] pY;
    wire enb;
    enemyDrawEnb dut (.horCnt(hor),
                      .verCnt(ver),
                      .posX(pX),
                      .posY(pY),
                      .enable(enb)
        );    
   initial begin 
    pX = 216;
    pY = 0;   
    for(i = 0; i < 480; i = i+1) begin 
        for(j = 0; j < 640; j = j+1) begin 
           hor = j;
           ver = i; 
           #1;
        end
    end
   end
endmodule
