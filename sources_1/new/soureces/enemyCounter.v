`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:22 12/02/2023 
// Design Name: 
// Module Name:    enemyCounter 
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
module enemyCounter(clk,
                    reset,
                    posX,
                    posY,
                    endgame
    );
    parameter iPosX = 216;
    parameter iPosY = 0; 
    parameter leftRim = 9;
    parameter rightRim = 630;
    input clk;
    input reset;
    reg direction;
    output reg endgame = 0;
    output reg [9:0] posX = iPosX;
    output reg [9:0] posY = iPosY;
    
    initial direction = 1'b0;

	always @(posedge clk or negedge reset) begin
        if(~reset) begin 
            posX <= iPosX;
        end 
        else begin 
            if(direction && endgame == 0) begin 
                posX <= posX + 12;
            end
            else if (endgame == 0)
                posX <= posX - 12;
        end
    end
     
    always @(posedge direction or negedge reset)begin 
        if(~reset) begin
            posY <= iPosY;
        end
        else if(endgame == 0) begin
            posY <= posY + 12;       
        end
    end
    
    always @(posX or reset) begin
        if(posX == 36) begin  //36
            direction = 1;
        end
        else if(posX == 216 || ~reset) //216
            direction = 0;

    end
    
    always @(posY or reset) begin 
        if(~reset)
            endgame = 0;
        else if(posY == 72) begin
            endgame = 1;
        end
    end
endmodule
