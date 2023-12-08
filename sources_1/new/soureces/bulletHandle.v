`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:02:43 12/01/2023 
// Design Name: 
// Module Name:    bulletHandle 
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
module bulletHandle(pbG,
						  clk,
						  collision,
						  reset,
						  playerPos,
						  horCnt,
						  verCnt,
						  bulletPosX,
						  bulletPosY,
						  rgbContent
    );
	input pbG;
	input clk;
	input collision;
	input reset; 
	input [9:0] playerPos;
	input [9:0] horCnt;
	input [9:0] verCnt;
	output reg [9:0]bulletPosX = 10'd319;
	output [9:0]bulletPosY ;
	output reg [5:0] rgbContent;
	wire [9:0] fireRateControlCnt;
	wire pbGtrig;
	wire movclk;
	wire counterEnable;
	wire fireRate; 
	
	assign pbGtrig = counterEnable | pbG | fireRate;

	bulletCounterControl u0 (.bulletPosY(bulletPosY),
									 .pbG(pbGtrig),
									 .collision(collision),
								    .enb(counterEnable)
    );
	 
	 bulletCounter u1 (.enb(counterEnable),
							 .clk(movclk),
							 .reset(reset),
							 .bulletPosY(bulletPosY)
    );
	 
	 
	 divBulletClk u2_1 (.clk_in(clk),
							  .clk_out(movclk)
    );

	 bulletCounter u3 (.enb(fireRate),
							 .clk(movclk),
							 .reset(reset), 
							 .bulletPosY(fireRateControlCnt)
    );
	 
	fireRateControl u4 (.bulletPosY(fireRateControlCnt),
							  .pbG(pbGtrig),
							  .enb(fireRate)
    );
	 
	 always @(posedge clk or negedge pbGtrig) begin 
		if(~pbGtrig)
			bulletPosX <= playerPos;
	 end
	 
	 always @(horCnt or verCnt or counterEnable or bulletPosX or bulletPosY) begin
		if(counterEnable && verCnt >= bulletPosY && verCnt <= bulletPosY+15)begin 
			if(horCnt >= bulletPosX+1 && horCnt <= bulletPosX+1)  
				rgbContent <= 6'b111111;
			else 
				rgbContent <= 6'b000000;
		end else 
			rgbContent <= 6'b000000;
	 end
endmodule
