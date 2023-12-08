`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 06:24:58 PM
// Design Name: 
// Module Name: enemyDrawEnb
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


module enemyDrawEnb(horCnt,
                    verCnt,
                    posX,
                    posY,
                    enable
    );
    
    localparam e0X = 31;
    localparam e0Y = 239;
    localparam e1X = 55;
    localparam e1Y = 239;
    localparam e2X = 79;
    localparam e2Y = 239;
    localparam e3X = 103;
    localparam e3Y = 239;
    localparam e4X = 127;
    localparam e4Y = 239;
    localparam e5X = 151;
    localparam e5Y = 239;
    localparam e6X = 175;
    localparam e6Y = 239;
    
    input [9:0] horCnt;
    input [9:0] verCnt;
    input [9:0] posX;
    input [9:0] posY;
    output reg enable = 0;
    
    always @(horCnt or verCnt) begin 
        if( horCnt <= e0X + posX+8 && horCnt >= e0X + posX-8 && verCnt <= e0Y + posY+8 && verCnt >= e0Y + posY-8||
            horCnt <= e1X + posX+8 && horCnt >= e1X + posX-8 && verCnt <= e1Y + posY+8 && verCnt >= e1Y + posY-8||
            horCnt <= e2X + posX+8 && horCnt >= e2X + posX-8 && verCnt <= e2Y + posY+8 && verCnt >= e2Y + posY-8||
            horCnt <= e3X + posX+8 && horCnt >= e3X + posX-8 && verCnt <= e3Y + posY+8 && verCnt >= e3Y + posY-8||
            horCnt <= e4X + posX+8 && horCnt >= e4X + posX-8 && verCnt <= e4Y + posY+8 && verCnt >= e4Y + posY-8||
            horCnt <= e5X + posX+8 && horCnt >= e5X + posX-8 && verCnt <= e5Y + posY+8 && verCnt >= e5Y + posY-8||
            horCnt <= e6X + posX+8 && horCnt >= e6X + posX-8 && verCnt <= e6Y + posY+8 && verCnt >= e6Y + posY-8 
        ) begin
            enable <= 1;
        end 
        else
            enable <= 0;   
    end
    
endmodule
