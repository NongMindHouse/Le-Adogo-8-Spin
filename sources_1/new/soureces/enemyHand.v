`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:50:58 12/03/2023 
// Design Name: 
// Module Name:    enemyHand 
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
module enemyHand(horCnt,
					  verCnt,
					  bulletPosX,
					  bulletPosY,
					  clk,
					  reset,
					  rgbContent,
					  collision
    );
	 
	 localparam red = 6'b000011;
	 localparam green = 6'b001100;
	 localparam blue = 6'b110000;
	 localparam black = 6'b101010;
	 
	localparam charWidth = 8;
	
	localparam p0InitX = 319;
	localparam p0InitY = 239;
	
	input [9:0] horCnt;
	input [9:0] verCnt;
	input [9:0] bulletPosX;
	input [9:0] bulletPosY;
	input clk; 
	input reset;
	 
	
	output [5:0] rgbContent;
	output collision;
	
	reg [14:0] enemyFlag = 15'b111111111111111;	
	
    wire [5:0] rgbE[26:0];
	
	wire [9:0]masterPosX;
	wire [9:0]masterPosY;

	wire [9:0]masterPosX1;
	wire [9:0]masterPosY1;
	
	wire enemyClk;
	wire col [26:0];
	
    movClk u0 (.clkIn(clk),
               .reset(reset),
               .clkOut(enemyClk)
        );	
// draw enemy 0
	enemyMaster  #(.iPosX(247),.iPosY(239),.leftRim(31),.rightRim(247)) u5_0 (.clk(enemyClk),
						   .bulletPosX(bulletPosX),
						   .bulletPosY(bulletPosY),
						   .reset(reset),
						   .enemyPresent(enemyFlag[0]),
						   .horCnt(horCnt),
						   .verCnt(verCnt), 
						   .posX(masterPosX),
                           .posY(masterPosY),  						   
						   .collisionFlag(col[0]),
						   .collisionFeedback(collision),
					       .rgbContentEnemy(rgbE[0])					
    );


    enemy #(.offsetX(24),.es(1)) u5_1 (.horCnt(horCnt),
             .verCnt(verCnt),
             .masterPosX(masterPosX),
             .masterPosY(masterPosY),
             .bulletPosX(bulletPosX),
             .bulletPosY(bulletPosY),
             .present(enemyFlag[1]),
             .collision(col[1]),
             .rgbContent(rgbE[1])

    );
    


    enemy #(.offsetX(48)) u5_2 (.horCnt(horCnt),
             .verCnt(verCnt),
             .masterPosX(masterPosX),
             .masterPosY(masterPosY),
             .bulletPosX(bulletPosX),
             .bulletPosY(bulletPosY),
             .present(enemyFlag[2]),
             .collision(col[2]),
             .rgbContent(rgbE[2])

    );

    enemy #(.offsetX(72)) u5_3 (.horCnt(horCnt),
             .verCnt(verCnt),
             .masterPosX(masterPosX),
             .masterPosY(masterPosY),
             .bulletPosX(bulletPosX),
             .bulletPosY(bulletPosY),
             .present(enemyFlag[3]),
             .collision(col[3]),
             .rgbContent(rgbE[3])

    );

    enemy #(.offsetX(96)) u5_4 (.horCnt(horCnt),
             .verCnt(verCnt),
             .masterPosX(masterPosX),
             .masterPosY(masterPosY),
             .bulletPosX(bulletPosX),
             .bulletPosY(bulletPosY),
             .present(enemyFlag[4]),
             .collision(col[4]),
             .rgbContent(rgbE[4])

    );

    enemy #(.offsetX(120)) u5_5 (.horCnt(horCnt),
             .verCnt(verCnt),
             .masterPosX(masterPosX),
             .masterPosY(masterPosY),
             .bulletPosX(bulletPosX),
             .bulletPosY(bulletPosY),
             .present(enemyFlag[5]),
             .collision(col[5]),
             .rgbContent(rgbE[5])

    );


    enemy #(.offsetX(144)) u5_6 (.horCnt(horCnt),
             .verCnt(verCnt),
             .masterPosX(masterPosX),
             .masterPosY(masterPosY),
             .bulletPosX(bulletPosX),
             .bulletPosY(bulletPosY),
             .present(enemyFlag[6]),
             .collision(col[6]),
             .rgbContent(rgbE[6])

    ); 

	enemyMaster2  #(.iPosX(247),.iPosY(215),.leftRim(31),.rightRim(247),.color(green)) u5_7 (.clk(enemyClk),
						   .bulletPosX(bulletPosX),
						   .bulletPosY(bulletPosY),
						   .reset(reset),
						   .enemyPresent(enemyFlag[7]),
						   .horCnt(horCnt),
						   .verCnt(verCnt), 
						   .posX(masterPosX1),
                           .posY(masterPosY1),  						   
						   .collisionFlag(col[7]),
						   .collisionFeedback(collision),
					       .rgbContentEnemy(rgbE[7])					
    );
 
     enemy #(.offsetX(24),.color(green)) u5_8 (.horCnt(horCnt),
             .verCnt(verCnt),
             .masterPosX(masterPosX1),
             .masterPosY(masterPosY1),
             .bulletPosX(bulletPosX),
             .bulletPosY(bulletPosY),
             .present(enemyFlag[8]),
             .collision(col[8]),
             .rgbContent(rgbE[8])

    );    

     enemy #(.offsetX(48),.color(green)) u5_9 (.horCnt(horCnt),
             .verCnt(verCnt),
             .masterPosX(masterPosX1),
             .masterPosY(masterPosY1),
             .bulletPosX(bulletPosX),
             .bulletPosY(bulletPosY),
             .present(enemyFlag[9]),
             .collision(col[9]),
             .rgbContent(rgbE[9])

    ); 

    enemy #(.offsetX(72),.color(green)) u5_10 (.horCnt(horCnt),
             .verCnt(verCnt),
             .masterPosX(masterPosX1),
             .masterPosY(masterPosY1),
             .bulletPosX(bulletPosX),
             .bulletPosY(bulletPosY),
             .present(enemyFlag[10]),
             .collision(col[10]),
             .rgbContent(rgbE[10])

    );

    enemy #(.offsetX(96),.color(green)) u5_11 (.horCnt(horCnt),
             .verCnt(verCnt),
             .masterPosX(masterPosX1),
             .masterPosY(masterPosY1),
             .bulletPosX(bulletPosX),
             .bulletPosY(bulletPosY),
             .present(enemyFlag[11]),
             .collision(col[11]),
             .rgbContent(rgbE[11])

    );

    enemy #(.offsetX(120),.color(green)) u5_12 (.horCnt(horCnt),
             .verCnt(verCnt),
             .masterPosX(masterPosX1),
             .masterPosY(masterPosY1),
             .bulletPosX(bulletPosX),
             .bulletPosY(bulletPosY),
             .present(enemyFlag[12]),
             .collision(col[12]),
             .rgbContent(rgbE[12])

    );


    enemy #(.offsetX(144),.color(green)) u5_13 (.horCnt(horCnt),
             .verCnt(verCnt),
             .masterPosX(masterPosX1),
             .masterPosY(masterPosY1),
             .bulletPosX(bulletPosX),
             .bulletPosY(bulletPosY),
             .present(enemyFlag[13]),
             .collision(col[13]),
             .rgbContent(rgbE[13])

    ); 
    

	always @(posedge col[0] or negedge reset) begin 
		if(~reset)
			enemyFlag[0] = 1;
		else 
			enemyFlag[0] = 0;
	end

	always @(posedge col[1] or negedge reset) begin 
		if(~reset)
			enemyFlag[1] = 1;
		else 
			enemyFlag[1] = 0;
	end

	always @(posedge col[2] or negedge reset) begin 
		if(~reset)
			enemyFlag[2] = 1;
		else 
			enemyFlag[2] = 0;
	end

	always @(posedge col[3] or negedge reset) begin 
		if(~reset)
			enemyFlag[3] = 1;
		else 
			enemyFlag[3] = 0;
	end

	always @(posedge col[4] or negedge reset) begin 
		if(~reset)
			enemyFlag[4] = 1;
		else 
			enemyFlag[4] = 0;
	end

	always @(posedge col[5] or negedge reset) begin 
		if(~reset)
			enemyFlag[5] = 1;
		else 
			enemyFlag[5] = 0;
	end

	always @(posedge col[6] or negedge reset) begin 
		if(~reset)
			enemyFlag[6] = 1;
		else 
			enemyFlag[6] = 0;
	end

	always @(posedge col[7] or negedge reset) begin 
		if(~reset)
			enemyFlag[7] = 1;
		else 
			enemyFlag[7] = 0;
	end


	always @(posedge col[8] or negedge reset) begin 
		if(~reset)
			enemyFlag[8] = 1;
		else 
			enemyFlag[8] = 0;
	end

	always @(posedge col[9] or negedge reset) begin 
		if(~reset)
			enemyFlag[9] = 1;
		else 
			enemyFlag[9] = 0;
	end
	
	always @(posedge col[10] or negedge reset) begin 
        if(~reset)
            enemyFlag[10] = 1;
        else 
            enemyFlag[10] = 0;
    end

	always @(posedge col[11] or negedge reset) begin 
		if(~reset)
			enemyFlag[11] = 1;
		else 
			enemyFlag[11] = 0;
	end

	always @(posedge col[12] or negedge reset) begin 
		if(~reset)
			enemyFlag[12] = 1;
		else 
			enemyFlag[12] = 0;
	end

	always @(posedge col[13] or negedge reset) begin 
		if(~reset)
			enemyFlag[13] = 1;
		else 
			enemyFlag[13] = 0;
	end
    
	assign collision = col[0] | col[1] | col[2] | col[3] | col[4] | col[5] | col[6] | col[7] | col[8] | col[9] 
	                   | col[10] | col[11] | col[12] | col[13] ;
	assign rgbContent = rgbE[0] | rgbE[1] | rgbE[2] | rgbE[3] | rgbE[4] | rgbE[5] | rgbE[6] | rgbE[7] | rgbE[8] | rgbE[9]
	                    | rgbE[10] | rgbE[11] | rgbE[12] | rgbE[13];

endmodule
