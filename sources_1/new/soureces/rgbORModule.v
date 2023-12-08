`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:59:42 12/01/2023 
// Design Name: 
// Module Name:    rgbORModule 
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
module rgbORModule(player,
						 header,
						 bullet,
						 enemy0,
						 content
    );

input [5:0] player;
input [5:0] header;
input [5:0] bullet;
input [5:0] enemy0;
output [5:0] content;


assign content = player | bullet | enemy0  | header;

endmodule
