`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 07:38:15 PM
// Design Name: 
// Module Name: enemymasterTB
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


module enemymasterTB();
    reg clk = 0;
    reg [9:0] bpx;
    reg [9:0] bpy;
    reg reset = 1;
    reg enemyPresent = 1 ; 
    reg [9:0] horCnt = 0;
    reg [9:0] verCnt = 0;
    
    wire [9:0] posX;
    wire [9:0] posY;
    wire collision;
    wire [5:0] rgb;
    
    always begin 
        #1;
        clk = ~clk;
    end
enemyMaster dut(.clk,
			  .bulletPosX(bpx),
			  .bulletPosY(bpy),
			  .reset(reset),
			  .enemyPresent(enemyPresent),
			  .horCnt(horCnt),
			  .verCnt(verCnt),
			  .posX(posX),
			  .posY(posY),		  
			  .collisionFlag(collision),
			  .rgbContentEnemy(rgb)					
    );
endmodule
