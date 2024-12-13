`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 10:37:43 AM
// Design Name: 
// Module Name: pipeline_compl_tb
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


module pipeline_compl_tb(

    );

    reg clk, reset;
    
    pipeline_compl uut (
        .clk(clk),
        .reset(reset)
    );
    
    always begin
        clk = 1'b0;
        #5;
        clk = 1'b1;
        #5;
    end
    initial begin
        reset = 0;
        #20;
        reset = 1;
        $finish;
    end

endmodule
