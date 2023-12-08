`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:46 12/01/2023 
// Design Name: 
// Module Name:    enimyHandle 
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
module enemyMaster2 (clk,
			  bulletPosX,
			  bulletPosY,
			  reset,
			  enemyPresent,
			  horCnt,
			  verCnt,
			  posX,
			  posY,		  
			  collisionFlag,
			  collisionFeedback,
			  rgbContentEnemy					
    );
	parameter characterWidth = 8;
	parameter color = 6'b000011;

    parameter iPosX = 69;
    parameter iPosY = 239; 
    parameter leftRim = 9;
    parameter rightRim = 630;
	
	input clk;
	input reset;
	input [9:0] bulletPosX;
	input [9:0] bulletPosY;
	input enemyPresent;
	input [9:0] horCnt;
	input [9:0] verCnt;	
	output [9:0] posX;
	output [9:0] posY;
	output reg collisionFlag = 0;
	output reg [5:0] rgbContentEnemy = 6'b000000;
	reg [16:0] data = 17'b00000000000000000;
	input collisionFeedback;

    enemyCounter #(.iPosX(iPosX),.iPosY(iPosY),.leftRim(leftRim),.rightRim(rightRim))u0 (.clk(clk),
                     .reset(reset),
                     .collisionFeedback(collisionFeedback),
                     .posX(posX),
                     .posY(posY)
    );
        
	always @(bulletPosY or bulletPosX) begin 
		if(bulletPosY > posY-4 && bulletPosY < posY+4 && bulletPosX > posX-characterWidth &&  bulletPosX < posX+characterWidth && enemyPresent ==1 ) begin 
			collisionFlag <= 1;
		end 
		else 
			collisionFlag <= 0;
	end
	
	always @(horCnt or verCnt) begin
		if(horCnt > posX-characterWidth && horCnt < posX+characterWidth && enemyPresent == 1) begin
			if(verCnt > posY-8 && verCnt < posY+8)
							      //fix here
                   begin
                       case(verCnt -(posY-characterWidth))
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
                   
                   case(data[horCnt-(posX-characterWidth)])
                       1: rgbContentEnemy <= 6'b111111;
                       0: rgbContentEnemy <= 6'b000000;
                       default: rgbContentEnemy <= 6'b000000;
                   endcase
      end
                   //fix here 
		else
			rgbContentEnemy <=  6'b000000;		
	   end
	   else
            rgbContentEnemy <=  6'b000000;        
      end
//	assign masterPosX = posX;
//    assign masterPosY = posY;
endmodule
