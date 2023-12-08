`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 06:06:06 PM
// Design Name: 
// Module Name: NewenemeyHandling
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


module NewenemeyHandling(horCnt,
                         verCnt,
                         reset,
                         bulletPosX,
                         bulletPosY,
                         clk,
                         collision,
                         collision2,
                         rgbContent,
                         endgameWin,
                         endgameLose
    );
    input [9:0] horCnt;
    input [9:0] verCnt;
    input [9:0] bulletPosX;
    input [9:0] bulletPosY;
    input reset;
    input clk;
//    input collisionF;
    output reg [5:0] rgbContent = 0;
    output collision;
    output collision2;
    output endgameWin;
    output endgameLose;
    wire [9:0] posX;
    wire [9:0] posY;
    wire drawEnb;
    wire divClk;
    reg [13:0] col = 14'd0;
    reg [16:0] data = 17'b00000000000000000;
    reg [13:0] enemy = 14'b11111111111111;

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
    
    localparam e7X = 31;
    localparam e7Y = 215;
    localparam e8X = 55;
    localparam e8Y = 215;
    localparam e9X = 79;
    localparam e9Y = 215;
    localparam e10X = 103;
    localparam e10Y = 215;
    localparam e11X = 127;
    localparam e11Y = 215;
    localparam e12X = 151;
    localparam e12Y = 215;
    localparam e13X = 175;
    localparam e13Y = 215;
    
    movClk u0 (.clkIn(clk),
               .reset(reset),
               .clkOut(divClk)
        );
    
    enemyCounter u1 (.clk(divClk),
                 .reset(reset),
                 .posX(posX),
                 .posY(posY),
                 .endgame(endgameLose)
    );
    
    always @(horCnt or verCnt or posX or posY) begin 
        if(horCnt <= e0X+posX+8 && horCnt >= e0X+posX-8 && verCnt <= e0Y+posY+8 && verCnt >= e0Y+posY-8 && enemy[0]) begin 
            case(verCnt -(e0Y+posY-8))
                10'd00: data = 17'b00000000000000000;
                10'd01: data = 17'b00000011111000000;
                10'd02: data = 17'b00001111111110000;
                10'd03: data = 17'b00011111111111000;
                10'd04: data = 17'b00011111111111000;
                10'd05: data = 17'b00111111111111100;
                10'd06: data = 17'b00111101110111100;
                10'd07: data = 17'b01111101110111110;
                10'd08: data = 17'b01111111111111110;
                10'd09: data = 17'b01111101110111110;
                10'd10: data = 17'b01111110001111110;
                10'd11: data = 17'b01111111111111110;
                10'd12: data = 17'b00111111111111100;
                10'd13: data = 17'b00000000000000000;
                10'd14: data = 17'b00111011011011100;
                10'd15: data = 17'b00111011011011100;
                10'd16: data = 17'b00011001010011000;
                default: data = 17'b00000000000000000;        
            endcase
            case(data[horCnt-(e0X+posX-8)])
                1: rgbContent <= 6'b111111; //111001
                0: rgbContent <= 6'b000000;
                default: rgbContent <= 6'b000000;
            endcase 
        end
        else if (horCnt <= e1X+posX+8 && horCnt >= e1X+posX-8 && verCnt <= e1Y+posY+8 && verCnt >= e1Y+posY-8 && enemy[1]) begin 
            case(verCnt -(e1Y+posY-8))
            10'd00: data = 17'b00000000000000000;
            10'd01: data = 17'b00000011111000000;
            10'd02: data = 17'b00001111111110000;
            10'd03: data = 17'b00011111111111000;
            10'd04: data = 17'b00011111111111000;
            10'd05: data = 17'b00111111111111100;
            10'd06: data = 17'b00111101110111100;
            10'd07: data = 17'b01111101110111110;
            10'd08: data = 17'b01111111111111110;
            10'd09: data = 17'b01111101110111110;
            10'd10: data = 17'b01111110001111110;
            10'd11: data = 17'b01111111111111110;
            10'd12: data = 17'b00111111111111100;
            10'd13: data = 17'b00000000000000000;
            10'd14: data = 17'b00111011011011100;
            10'd15: data = 17'b00111011011011100;
            10'd16: data = 17'b00011001010011000;
            default: data = 17'b00000000000000000;        
        endcase
        case(data[horCnt-(e1X+posX-8)])
            1: rgbContent <= 6'b111111; //111001
            0: rgbContent <= 6'b000000;
            default: rgbContent <= 6'b000000;
        endcase  
        end
        else if (horCnt <= e2X+posX+8 && horCnt >= e2X+posX-8 && verCnt <= e2Y+posY+8 && verCnt >= e2Y+posY-8 && enemy[2]) begin 
            case(verCnt -(e2Y+posY-8))
        10'd00: data = 17'b00000000000000000;
        10'd01: data = 17'b00000011111000000;
        10'd02: data = 17'b00001111111110000;
        10'd03: data = 17'b00011111111111000;
        10'd04: data = 17'b00011111111111000;
        10'd05: data = 17'b00111111111111100;
        10'd06: data = 17'b00111101110111100;
        10'd07: data = 17'b01111101110111110;
        10'd08: data = 17'b01111111111111110;
        10'd09: data = 17'b01111101110111110;
        10'd10: data = 17'b01111110001111110;
        10'd11: data = 17'b01111111111111110;
        10'd12: data = 17'b00111111111111100;
        10'd13: data = 17'b00000000000000000;
        10'd14: data = 17'b00111011011011100;
        10'd15: data = 17'b00111011011011100;
        10'd16: data = 17'b00011001010011000;
        default: data = 17'b00000000000000000;        
    endcase
    case(data[horCnt-(e2X+posX-8)])
        1: rgbContent <= 6'b111111; //111001
        0: rgbContent <= 6'b000000;
        default: rgbContent <= 6'b000000;
    endcase  
        end
        else if (horCnt <= e3X+posX+8 && horCnt >= e3X+posX-8 && verCnt <= e3Y+posY+8 && verCnt >= e3Y+posY-8 && enemy[3]) begin 
            case(verCnt -(e3Y+posY-8))
        10'd00: data = 17'b00000000000000000;
        10'd01: data = 17'b00000011111000000;
        10'd02: data = 17'b00001111111110000;
        10'd03: data = 17'b00011111111111000;
        10'd04: data = 17'b00011111111111000;
        10'd05: data = 17'b00111111111111100;
        10'd06: data = 17'b00111101110111100;
        10'd07: data = 17'b01111101110111110;
        10'd08: data = 17'b01111111111111110;
        10'd09: data = 17'b01111101110111110;
        10'd10: data = 17'b01111110001111110;
        10'd11: data = 17'b01111111111111110;
        10'd12: data = 17'b00111111111111100;
        10'd13: data = 17'b00000000000000000;
        10'd14: data = 17'b00111011011011100;
        10'd15: data = 17'b00111011011011100;
        10'd16: data = 17'b00011001010011000;
        default: data = 17'b00000000000000000;        
    endcase
    case(data[horCnt-(e3X+posX-8)])
        1: rgbContent <= 6'b111111; //111001
        0: rgbContent <= 6'b000000;
        default: rgbContent <= 6'b000000;
    endcase 
        end
        else if (horCnt <= e4X+posX+8 && horCnt >= e4X+posX-8 && verCnt <= e4Y+posY+8 && verCnt >= e4Y+posY-8 && enemy[4]) begin 
            case(verCnt -(e4Y+posY-8))
        10'd00: data = 17'b00000000000000000;
        10'd01: data = 17'b00000011111000000;
        10'd02: data = 17'b00001111111110000;
        10'd03: data = 17'b00011111111111000;
        10'd04: data = 17'b00011111111111000;
        10'd05: data = 17'b00111111111111100;
        10'd06: data = 17'b00111101110111100;
        10'd07: data = 17'b01111101110111110;
        10'd08: data = 17'b01111111111111110;
        10'd09: data = 17'b01111101110111110;
        10'd10: data = 17'b01111110001111110;
        10'd11: data = 17'b01111111111111110;
        10'd12: data = 17'b00111111111111100;
        10'd13: data = 17'b00000000000000000;
        10'd14: data = 17'b00111011011011100;
        10'd15: data = 17'b00111011011011100;
        10'd16: data = 17'b00011001010011000;
        default: data = 17'b00000000000000000;        
    endcase
    case(data[horCnt-(e4X+posX-8)])
        1: rgbContent <= 6'b111111; //111001
        0: rgbContent <= 6'b000000;
        default: rgbContent <= 6'b000000;
    endcase 
        end
        else if (horCnt <= e5X+posX+8 && horCnt >= e5X+posX-8 && verCnt <= e5Y+posY+8 && verCnt >= e5Y+posY-8 && enemy[5]) begin 
            case(verCnt -(e5Y+posY-8))
        10'd00: data = 17'b00000000000000000;
        10'd01: data = 17'b00000011111000000;
        10'd02: data = 17'b00001111111110000;
        10'd03: data = 17'b00011111111111000;
        10'd04: data = 17'b00011111111111000;
        10'd05: data = 17'b00111111111111100;
        10'd06: data = 17'b00111101110111100;
        10'd07: data = 17'b01111101110111110;
        10'd08: data = 17'b01111111111111110;
        10'd09: data = 17'b01111101110111110;
        10'd10: data = 17'b01111110001111110;
        10'd11: data = 17'b01111111111111110;
        10'd12: data = 17'b00111111111111100;
        10'd13: data = 17'b00000000000000000;
        10'd14: data = 17'b00111011011011100;
        10'd15: data = 17'b00111011011011100;
        10'd16: data = 17'b00011001010011000;
        default: data = 17'b00000000000000000;        
    endcase
    case(data[horCnt-(e5X+posX-8)])
        1: rgbContent <= 6'b111111; //111001
        0: rgbContent <= 6'b000000;
        default: rgbContent <= 6'b000000;
    endcase  
        end
        else if (horCnt <= e6X+posX+8 && horCnt >= e6X+posX-8 && verCnt <= e6Y+posY+8 && verCnt >= e6Y+posY-8 && enemy[6]) begin 
            case(verCnt -(e6Y+posY-8))
        10'd00: data = 17'b00000000000000000;
        10'd01: data = 17'b00000011111000000;
        10'd02: data = 17'b00001111111110000;
        10'd03: data = 17'b00011111111111000;
        10'd04: data = 17'b00011111111111000;
        10'd05: data = 17'b00111111111111100;
        10'd06: data = 17'b00111101110111100;
        10'd07: data = 17'b01111101110111110;
        10'd08: data = 17'b01111111111111110;
        10'd09: data = 17'b01111101110111110;
        10'd10: data = 17'b01111110001111110;
        10'd11: data = 17'b01111111111111110;
        10'd12: data = 17'b00111111111111100;
        10'd13: data = 17'b00000000000000000;
        10'd14: data = 17'b00111011011011100;
        10'd15: data = 17'b00111011011011100;
        10'd16: data = 17'b00011001010011000;
        default: data = 17'b00000000000000000;        
    endcase
    case(data[horCnt-(e6X+posX-8)])
        1: rgbContent <= 6'b111111; //111001
        0: rgbContent <= 6'b000000;
        default: rgbContent <= 6'b000000;
    endcase  
        end 
        else if (horCnt <= e7X+posX+8 && horCnt >= e7X+posX-8 && verCnt <= e7Y+posY+8 && verCnt >= e7Y+posY-8 && enemy[7]) begin 
            case(verCnt -(e7Y+posY-8))
    10'd00: data = 17'b00000000000000000;
    10'd01: data = 17'b00000011111000000;
    10'd02: data = 17'b00001111111110000;
    10'd03: data = 17'b00011111111111000;
    10'd04: data = 17'b00011111111111000;
    10'd05: data = 17'b00111111111111100;
    10'd06: data = 17'b00111101110111100;
    10'd07: data = 17'b01111101110111110;
    10'd08: data = 17'b01111111111111110;
    10'd09: data = 17'b01111101110111110;
    10'd10: data = 17'b01111110001111110;
    10'd11: data = 17'b01111111111111110;
    10'd12: data = 17'b00111111111111100;
    10'd13: data = 17'b00000000000000000;
    10'd14: data = 17'b00111011011011100;
    10'd15: data = 17'b00111011011011100;
    10'd16: data = 17'b00011001010011000;
    default: data = 17'b00000000000000000;        
endcase
case(data[horCnt-(e7X+posX-8)])
    1: rgbContent <= 6'b111111; //111001
    0: rgbContent <= 6'b000000;
    default: rgbContent <= 6'b000000;
endcase   
        end 
        else if (horCnt <= e8X+posX+8 && horCnt >= e8X+posX-8 && verCnt <= e8Y+posY+8 && verCnt >= e8Y+posY-8 && enemy[8]) begin 
            case(verCnt -(e8Y+posY-8))
    10'd00: data = 17'b00000000000000000;
    10'd01: data = 17'b00000011111000000;
    10'd02: data = 17'b00001111111110000;
    10'd03: data = 17'b00011111111111000;
    10'd04: data = 17'b00011111111111000;
    10'd05: data = 17'b00111111111111100;
    10'd06: data = 17'b00111101110111100;
    10'd07: data = 17'b01111101110111110;
    10'd08: data = 17'b01111111111111110;
    10'd09: data = 17'b01111101110111110;
    10'd10: data = 17'b01111110001111110;
    10'd11: data = 17'b01111111111111110;
    10'd12: data = 17'b00111111111111100;
    10'd13: data = 17'b00000000000000000;
    10'd14: data = 17'b00111011011011100;
    10'd15: data = 17'b00111011011011100;
    10'd16: data = 17'b00011001010011000;
    default: data = 17'b00000000000000000;        
endcase
case(data[horCnt-(e8X+posX-8)])
    1: rgbContent <= 6'b111111; //111001
    0: rgbContent <= 6'b000000;
    default: rgbContent <= 6'b000000;
endcase  
        end   
        else if (horCnt <= e9X+posX+8 && horCnt >= e9X+posX-8 && verCnt <= e9Y+posY+8 && verCnt >= e9Y+posY-8 && enemy[9]) begin 
                        case(verCnt -(e9Y+posY-8))
    10'd00: data = 17'b00000000000000000;
    10'd01: data = 17'b00000011111000000;
    10'd02: data = 17'b00001111111110000;
    10'd03: data = 17'b00011111111111000;
    10'd04: data = 17'b00011111111111000;
    10'd05: data = 17'b00111111111111100;
    10'd06: data = 17'b00111101110111100;
    10'd07: data = 17'b01111101110111110;
    10'd08: data = 17'b01111111111111110;
    10'd09: data = 17'b01111101110111110;
    10'd10: data = 17'b01111110001111110;
    10'd11: data = 17'b01111111111111110;
    10'd12: data = 17'b00111111111111100;
    10'd13: data = 17'b00000000000000000;
    10'd14: data = 17'b00111011011011100;
    10'd15: data = 17'b00111011011011100;
    10'd16: data = 17'b00011001010011000;
    default: data = 17'b00000000000000000;        
endcase
case(data[horCnt-(e9X+posX-8)])
    1: rgbContent <= 6'b111111; //111001
    0: rgbContent <= 6'b000000;
    default: rgbContent <= 6'b000000;
endcase  
        end   
        else if (horCnt <= e10X+posX+8 && horCnt >= e10X+posX-8 && verCnt <= e10Y+posY+8 && verCnt >= e10Y+posY-8 && enemy[10]) begin 
                        case(verCnt -(e10Y+posY-8))
    10'd00: data = 17'b00000000000000000;
    10'd01: data = 17'b00000011111000000;
    10'd02: data = 17'b00001111111110000;
    10'd03: data = 17'b00011111111111000;
    10'd04: data = 17'b00011111111111000;
    10'd05: data = 17'b00111111111111100;
    10'd06: data = 17'b00111101110111100;
    10'd07: data = 17'b01111101110111110;
    10'd08: data = 17'b01111111111111110;
    10'd09: data = 17'b01111101110111110;
    10'd10: data = 17'b01111110001111110;
    10'd11: data = 17'b01111111111111110;
    10'd12: data = 17'b00111111111111100;
    10'd13: data = 17'b00000000000000000;
    10'd14: data = 17'b00111011011011100;
    10'd15: data = 17'b00111011011011100;
    10'd16: data = 17'b00011001010011000;
    default: data = 17'b00000000000000000;        
endcase
case(data[horCnt-(e10X+posX-8)])
    1: rgbContent <= 6'b111111; //111001
    0: rgbContent <= 6'b000000;
    default: rgbContent <= 6'b000000;
endcase   
        end   
        else if (horCnt <= e11X+posX+8 && horCnt >= e11X+posX-8 && verCnt <= e11Y+posY+8 && verCnt >= e11Y+posY-8 && enemy[11]) begin 
                        case(verCnt -(e11Y+posY-8))
    10'd00: data = 17'b00000000000000000;
    10'd01: data = 17'b00000011111000000;
    10'd02: data = 17'b00001111111110000;
    10'd03: data = 17'b00011111111111000;
    10'd04: data = 17'b00011111111111000;
    10'd05: data = 17'b00111111111111100;
    10'd06: data = 17'b00111101110111100;
    10'd07: data = 17'b01111101110111110;
    10'd08: data = 17'b01111111111111110;
    10'd09: data = 17'b01111101110111110;
    10'd10: data = 17'b01111110001111110;
    10'd11: data = 17'b01111111111111110;
    10'd12: data = 17'b00111111111111100;
    10'd13: data = 17'b00000000000000000;
    10'd14: data = 17'b00111011011011100;
    10'd15: data = 17'b00111011011011100;
    10'd16: data = 17'b00011001010011000;
    default: data = 17'b00000000000000000;        
endcase
case(data[horCnt-(e11X+posX-8)])
    1: rgbContent <= 6'b111111; //111001
    0: rgbContent <= 6'b000000;
    default: rgbContent <= 6'b000000;
endcase   
        end   
        else if (horCnt <= e12X+posX+8 && horCnt >= e12X+posX-8 && verCnt <= e12Y+posY+8 && verCnt >= e12Y+posY-8 && enemy[12]) begin 
                        case(verCnt -(e12Y+posY-8))
    10'd00: data = 17'b00000000000000000;
    10'd01: data = 17'b00000011111000000;
    10'd02: data = 17'b00001111111110000;
    10'd03: data = 17'b00011111111111000;
    10'd04: data = 17'b00011111111111000;
    10'd05: data = 17'b00111111111111100;
    10'd06: data = 17'b00111101110111100;
    10'd07: data = 17'b01111101110111110;
    10'd08: data = 17'b01111111111111110;
    10'd09: data = 17'b01111101110111110;
    10'd10: data = 17'b01111110001111110;
    10'd11: data = 17'b01111111111111110;
    10'd12: data = 17'b00111111111111100;
    10'd13: data = 17'b00000000000000000;
    10'd14: data = 17'b00111011011011100;
    10'd15: data = 17'b00111011011011100;
    10'd16: data = 17'b00011001010011000;
    default: data = 17'b00000000000000000;        
endcase
case(data[horCnt-(e12X+posX-8)])
    1: rgbContent <= 6'b111111; //111001
    0: rgbContent <= 6'b000000;
    default: rgbContent <= 6'b000000;
endcase   
        end   
        else if (horCnt <= e13X+posX+8 && horCnt >= e13X+posX-8 && verCnt <= e13Y+posY+8 && verCnt >= e13Y+posY-8 && enemy[13]) begin 
                        case(verCnt -(e13Y+posY-8))
    10'd00: data = 17'b00000000000000000;
    10'd01: data = 17'b00000011111000000;
    10'd02: data = 17'b00001111111110000;
    10'd03: data = 17'b00011111111111000;
    10'd04: data = 17'b00011111111111000;
    10'd05: data = 17'b00111111111111100;
    10'd06: data = 17'b00111101110111100;
    10'd07: data = 17'b01111101110111110;
    10'd08: data = 17'b01111111111111110;
    10'd09: data = 17'b01111101110111110;
    10'd10: data = 17'b01111110001111110;
    10'd11: data = 17'b01111111111111110;
    10'd12: data = 17'b00111111111111100;
    10'd13: data = 17'b00000000000000000;
    10'd14: data = 17'b00111011011011100;
    10'd15: data = 17'b00111011011011100;
    10'd16: data = 17'b00011001010011000;
    default: data = 17'b00000000000000000;        
endcase
case(data[horCnt-(e13X+posX-8)])
    1: rgbContent <= 6'b111111; //111001
    0: rgbContent <= 6'b000000;
    default: rgbContent <= 6'b000000;
endcase  ; 
        end          
        else begin
           rgbContent <= 6'b000000; 
        end
    end      

    always @(bulletPosX or bulletPosY or posX or posY) begin
        if(bulletPosX <= e0X+posX+8 && bulletPosX >= e0X+posX-8 && enemy[0]) begin 
            if(bulletPosY < e0Y+posY+8 && bulletPosY > e0Y+posY-8)
                col[0] = 1'b1;
            else
                col[0] = 1'b0;
        end
        else if(bulletPosX <= e1X+posX+8 && bulletPosX >= e1X+posX-8 && bulletPosY < e1Y+posY+8 && bulletPosY > e1Y+posY-8 && enemy[1]) begin 
            col[1] = 1'b1;
        end
        else if(bulletPosX <= e2X+posX+8 && bulletPosX >= e2X+posX-8 && bulletPosY < e2Y+posY+8 && bulletPosY > e2Y+posY-8 && enemy[2]) begin 
            col[2] = 1'b1;
        end
        else if(bulletPosX <= e3X+posX+8 && bulletPosX >= e3X+posX-8 && bulletPosY < e3Y+posY+8 && bulletPosY > e3Y+posY-8 && enemy[3]) begin 
            col[3] = 1'b1;
        end
        else if(bulletPosX <= e4X+posX+8 && bulletPosX >= e4X+posX-8 && bulletPosY < e4Y+posY+8 && bulletPosY > e4Y+posY-8 && enemy[4]) begin 
            col[4] = 1'b1;
        end
        else if(bulletPosX <= e5X+posX+8 && bulletPosX >= e5X+posX-8 && bulletPosY < e5Y+posY+8 && bulletPosY > e5Y+posY-8 && enemy[5]) begin 
            col[5] = 1'b1;
        end
        else if(bulletPosX <= e6X+posX+8 && bulletPosX >= e6X+posX-8 && bulletPosY < e6Y+posY+8 && bulletPosY > e6Y+posY-8 && enemy[6]) begin 
            col[6] = 1'b1;
        end
        else if(bulletPosX <= e7X+posX+8 && bulletPosX >= e7X+posX-8 && bulletPosY < e7Y+posY+8 && bulletPosY > e7Y+posY-8 && enemy[7]) begin 
            col[7] = 1'b1;
        end
        else if(bulletPosX <= e8X+posX+8 && bulletPosX >= e8X+posX-8 && bulletPosY < e8Y+posY+8 && bulletPosY > e8Y+posY-8 && enemy[8]) begin 
            col[8] = 1'b1;
        end
        else if(bulletPosX <= e9X+posX+8 && bulletPosX >= e9X+posX-8 && bulletPosY < e9Y+posY+8 && bulletPosY > e9Y+posY-8 && enemy[9]) begin 
            col[9] = 1'b1;
        end
        else if(bulletPosX <= e10X+posX+8 && bulletPosX >= e10X+posX-8 && bulletPosY < e10Y+posY+8 && bulletPosY > e10Y+posY-8 && enemy[10]) begin 
            col[10] = 1'b1;
        end
       else if(bulletPosX <= e11X+posX+8 && bulletPosX >= e11X+posX-8 && bulletPosY < e11Y+posY+8 && bulletPosY > e11Y+posY-8 && enemy[11]) begin 
            col[11] = 1'b1;
        end
        else if(bulletPosX <= e12X+posX+8 && bulletPosX >= e12X+posX-8 && bulletPosY < e12Y+posY+8 && bulletPosY > e12Y+posY-8 && enemy[12]) begin 
            col[12] = 1'b1;
        end
        else if(bulletPosX <= e13X+posX+8 && bulletPosX >= e13X+posX-8 && bulletPosY < e13Y+posY+8 && bulletPosY > e13Y+posY-8 && enemy[13]) begin 
            col[13] = 1'b1;
        end                        
        else
            col = 14'd0;
    end

    always @(posedge col[0] or negedge reset) begin
        if(~reset)
            enemy[0] = 1'b1;
        else    
            enemy[0] = 1'b0; 
    end

    always @(posedge col[1] or negedge reset) begin
        if(~reset)
            enemy[1] = 1'b1;
        else    
            enemy[1] = 1'b0; 
    end
    
    always @(posedge col[2] or negedge reset) begin
        if(~reset)
            enemy[2] = 1'b1;
        else    
            enemy[2] = 1'b0; 
    end
    
    always @(posedge col[3] or negedge reset) begin
        if(~reset)
            enemy[3] = 1'b1;
        else    
            enemy[3] = 1'b0; 
    end
    
    always @(posedge col[4] or negedge reset) begin
        if(~reset)
            enemy[4] = 1'b1;
        else    
            enemy[4] = 1'b0; 
    end
    
    always @(posedge col[5] or negedge reset) begin
        if(~reset)
            enemy[5] = 1'b1;
        else    
            enemy[5] = 1'b0; 
    end

    always @(posedge col[6] or negedge reset) begin
        if(~reset)
            enemy[6] = 1'b1;
        else    
            enemy[6] = 1'b0; 
    end
 
    always @(posedge col[7] or negedge reset) begin
        if(~reset)
            enemy[7] = 1'b1;
        else    
            enemy[7] = 1'b0; 
    end

    always @(posedge col[8] or negedge reset) begin
        if(~reset)
            enemy[8] = 1'b1;
        else    
            enemy[8] = 1'b0; 
    end
    
    always @(posedge col[9] or negedge reset) begin
        if(~reset)
            enemy[9] = 1'b1;
        else    
            enemy[9] = 1'b0; 
    end
    
    always @(posedge col[10] or negedge reset) begin
        if(~reset)
            enemy[10] = 1'b1;
        else    
            enemy[10] = 1'b0; 
    end
    
    always @(posedge col[11] or negedge reset) begin
        if(~reset)
            enemy[11] = 1'b1;
        else    
            enemy[11] = 1'b0; 
    end
    
    always @(posedge col[12] or negedge reset) begin
        if(~reset)
            enemy[12] = 1'b1;
        else    
            enemy[12] = 1'b0; 
    end
    
    always @(posedge col[13] or negedge reset) begin
        if(~reset)
            enemy[13] = 1'b1;
        else    
            enemy[13] = 1'b0; 
    end
    assign collision = col[0] | col[1] | col[2] | col[3] | col[4] | col[5] | col[6];
    assign collision2 = col[7] | col[8] | col[9] | col[10] | col[11] | col[12] | col[13];
    assign endgameWin = ~(enemy[0] | enemy[1] | enemy[2] | enemy[3] | enemy[4] | enemy[5] | enemy[6] |
                          enemy[7] | enemy[8] | enemy[9] | enemy[10] | enemy[11] | enemy[12] | enemy[13] ); 
endmodule
