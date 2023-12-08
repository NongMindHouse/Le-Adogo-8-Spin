`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:31:36 11/28/2023
// Design Name:   topModule
// Module Name:   D:/FPGA/Adoga_SpersInvadace/version0_AdogaSpersInvadace/SourceFile/Design/topmoduleTB.v
// Project Name:  version0_AdogaSpersInvadace
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: topModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module topmoduleTB;

	// Inputs
	reg CLK22_78MHZ = 0 ;
	reg pbR;
	reg pbL;
	reg pbG;
	reg enb;
	// Outputs
	wire [1:0] vgaRed;
	wire [1:0] vgaGreen;
	wire [1:0] vgaBlue;
	wire hSync;
	wire vSync;
	always begin
		#22;
		CLK22_78MHZ = ~CLK22_78MHZ;
	end
	// Instantiate the Unit Under Test (UUT)
	topModule uut (
		.CLK22_78MHZ(CLK22_78MHZ), 
		.pbR(pbR), 
		.pbL(pbL), 
		.pbG(pbG), 
		.vgaRed(vgaRed), 
		.vgaGreen(vgaGreen), 
		.vgaBlue(vgaBlue), 
		.hSync(hSync), 
		.vSync(vSync)
	);
	
	//clock #(.FREQ(22780))clkg(CLK22_78MHZ,enb);
	initial begin
		// Initialize Inputs
		enb = 0;
		#2;
		enb = 1;
		pbR = 1;
		pbL = 1;
		pbG = 1;

		// Wait 100 ns for global reset to finish
		#2;
      pbG = 0; 
		// Add stimulus here

	end
      
endmodule

