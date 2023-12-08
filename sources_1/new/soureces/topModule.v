`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:41:27 11/28/2023 
// Design Name: 
// Module Name:    topModule 
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
module topModule(input CLK100MHZ,
					  input pbR,
					  input pbL,
					  input pbG,
					  input gameReset,
					  output [1:0] vgaRed,
					  output [1:0] vgaGreen,
					  output [1:0] vgaBlue,
					  output hSync,
					  output vSync,
					  output [6:0]seg,
					  output [3:0] an
    );
	 reg [3:0] scoreCnt = 0; 
	 wire [5:0] rgbContent;
	 
	 wire [5:0] rgbContentPlayer;
	 wire [9:0] horizontalCount;
	 wire [9:0] verticalCount;
	 
	 wire [9:0] bulletPosX;
	 wire [9:0] bulletPosY;
	 
	 //assign collision = 0;
	 wire BULLET_ENB;
	 
	 wire VGACLK;
	 wire MAIN_CLK;
	 wire MOVE_CLK;
	 wire BULLET_CLK;
	 wire DCM_RESET;
	 assign DCM_RESET = 0;
	 
	 wire [9:0] playerPos;
	 wire [5:0] rgbContentBullet;
	 wire [5:0] rgbHeaderContent;
	 wire [5:0] rgbContentEnemy0;
	 wire collision;
	 wire collisionOr;
	 wire collision2;
	 wire endgamewin;
	 wire endgameLose;


    wire gameCLK;
    wire pbGwithdisable;
    wire pbLlockable;
    wire pbRlockable;
    //assign gameCLK = ~hSync;
    vgaCLKDIV u0 (.clk_in1(CLK100MHZ),
               .clk_out1(VGACLK),
               .clk_out2(MAIN_CLK),
               .reset(DCM_RESET)
 );
	 
	 vgaModule u1 (.clk(VGACLK),
					   .rgbContent(rgbContent),
					   .horCnt(horizontalCount),
					   .verCnt(verticalCount),
					   .vgaRed(vgaRed),
					   .vgaGreen(vgaGreen),
					   .vgaBlue(vgaBlue),
					   .hSync(hSync),
					   .vSync(vSync),
					   .sActive(gameCLK)
    );
	 
	 rgbORModule u1_1(.player(rgbContentPlayer),
							.header(rgbHeaderContent),
						   .bullet(rgbContentBullet),
							.enemy0(rgbContentEnemy0),
						   .content(rgbContent)
    );	 
	 
	 divmoveclk u2_0 (.clk_in(gameCLK),
						 .clk_out(MOVE_CLK),
						 .reset(gameReset)
    );


	 assign pbLlockable = pbL | endgameLose ;
	 assign pbRlockable = pbR | endgameLose ;
	 playerHandle u3(.pbL(pbLlockable),
						  .pbR(pbRlockable),
						  .horCnt(horizontalCount),
						  .verCnt(verticalCount),
						  .clk(MOVE_CLK),
						  .content(rgbContentPlayer),
						  .playerPos(playerPos),
						  .reset(gameReset)
    );
	 
	 assign pbGwithdisable = pbG | endgameLose;
	 
	 bulletHandle u4(.pbG(pbGwithdisable),
						  .clk(gameCLK),
						  .collision(collisionOr),
						  .reset(gameReset), 
						  .playerPos(playerPos),
						  .horCnt(horizontalCount),
						  .verCnt(verticalCount),
						  .bulletPosX(bulletPosX),
						  .bulletPosY(bulletPosY),
						  .rgbContent(rgbContentBullet)
						  //.bulletEnb(BULLET_ENB)
    );
    
    assign collisionOr = collision | collision2;
    
    NewenemeyHandling u5(.horCnt(horizontalCount),
                      .verCnt(verticalCount),
                       .reset(gameReset),
                       .bulletPosX(bulletPosX),
                       .bulletPosY(bulletPosY),
                       .clk(MOVE_CLK),
                       .collision(collision),
                       .collision2(collision2),
                      .rgbContent(rgbContentEnemy0),
                      .endgameWin(endgamewin),
                      .endgameLose(endgameLose)
                      
     );
     
	 header h (.horCnt(horizontalCount),
				  .verCnt(verticalCount),
				  .rgbContent(rgbHeaderContent),
				  .endgamewin(endgamewin),
				  .endgameLose(endgameLose)
    );
	 always @(posedge collisionOr or negedge gameReset) begin
		if(~gameReset) 
			scoreCnt = 0;
		else
			scoreCnt = scoreCnt + 1'b1;
	 end

                        
	seg u7(.score(scoreCnt),
	        .reset(gameReset),
	        .seg(seg),
	        .clk(MAIN_CLK),
	        .an(an[3:0]));
	
endmodule
