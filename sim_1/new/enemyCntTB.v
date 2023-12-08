`timescale 1ns / 1ps


module ecnttb();
    reg clk = 0;
    reg reset = 0;
    
    wire [9:0] posX;
    wire [9:0] posY;
    always begin 
        #2;
        clk = ~clk;
    end
    
enemyCounter dut(.clk(clk),
             .reset(reset),
             .posX(posX),
             .posY(posY)
        ); 
        
initial begin 
    #4;
    reset = 1;
end   
endmodule