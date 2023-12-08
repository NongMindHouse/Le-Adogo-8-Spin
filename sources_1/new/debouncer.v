`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 12:06:52 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(clk,
                 pb,
                 reset,
                 pbDebounced
    );
    input clk;
    input pb;
    input reset;
    output pbDebounced;
    wire debounceClk;
    wire Q1,Q2,Q2Bar;
    
    debounceClk u0 (.clkIn(clk),
                    .reset(reset),
                    .clkOut(debounceClk)
        );     
    DFF u1(.clk(debounceClk),
           .D(pb),
           .Q(Q1),
           .reset(reset));

    DFF u2(.clk(debounceClk),
           .D(Q1),
           .Q(Q2),
           .reset(reset));
    assign Q2Bar = ~Q2;
    assign pbDebounced = (Q2 & Q1);
endmodule
