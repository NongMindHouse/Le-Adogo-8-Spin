`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 06:48:10 PM
// Design Name: 
// Module Name: enemy
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


module enemy(horCnt,
             verCnt,
             masterPosX,
             masterPosY,
             bulletPosX,
             bulletPosY,
             present,
             collision,
             rgbContent

    );
    
    parameter color = 6'b000011;
    parameter offsetX = 0;
    parameter offsetY = 0;
    parameter characterWidth = 8;
    parameter es = 0;
    
    input [9:0] horCnt;
    input [9:0] verCnt;
    input [9:0] masterPosX;
    input [9:0] masterPosY;
    input [9:0] bulletPosX;
    input [9:0] bulletPosY;
    input present; 
    output reg collision;
    output reg [5:0] rgbContent = color ;
    reg [16:0] data = 17'b00000000000000000;
    
	always @(bulletPosY or bulletPosX) begin 
        if(bulletPosY > (masterPosY-offsetY)-4 && bulletPosY < (masterPosY-offsetY)+4 && bulletPosX > (masterPosX+offsetX)-characterWidth &&  bulletPosX < (masterPosX+offsetX)+characterWidth && present ==1 ) begin 
            collision <= 1;
        end 
        else 
            collision <= 0;
    end 
    
	always @(horCnt or verCnt) begin
        if(horCnt > (masterPosX+offsetX)-characterWidth && horCnt < (masterPosX+offsetX)+characterWidth && present == 1) begin
            if(verCnt > (masterPosY-offsetY)-characterWidth && verCnt < (masterPosY-offsetY)+characterWidth)
                 //fix here
                                    begin
                                        case(verCnt -(masterPosY-characterWidth))
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
                                              
                                              10'd17: data = 17'b11110000000001111;       
                                              10'd18: data = 17'b00111100000111100;    
                                              10'd19: data = 17'b00111111111111100;   
                                              10'd20: data = 17'b01110011111001110;    
                                              10'd21: data = 17'b01110011111001110;    
                                              10'd22: data = 17'b11011111111111011;   
                                              10'd23: data = 17'b11001111111110011;    
                                              10'd24: data = 17'b11100011111000111;    
                                              10'd25: data = 17'b00111000000011100;   
                                              10'd26: data = 17'b00000111111100000;    
                                              10'd27: data = 17'b00111111111111100;    
                                              10'd28: data = 17'b00110111111101100;   
                                              10'd29: data = 17'b00110111111101100;    
                                              10'd30: data = 17'b00000111111100000;     
                                              10'd31: data = 17'b00000110001100000;
                                              10'd32: data = 17'b00000110001100000;
                                              default: data = 17'b00000000000000000;        
                                    endcase
                                    case(data[horCnt-(masterPosX-characterWidth+offsetX)])
                                        1: rgbContent <= 6'b111001;
                                        0: rgbContent <= 6'b000000;
                                        default: rgbContent <= 6'b000000;
                                    endcase
                       end
                                    //fix here 
        end
        else
            rgbContent <=  6'b000000;        
    end       
endmodule


//(masterPosX+offsetX) 