`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 02:18:41 PM
// Design Name: 
// Module Name: incrementer_tb
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


module incrementer_tb;

    reg[31:0] PC;
    wire [31:0] Next_PC;
    
    incrementer adder(
        .PC(PC),
        .Next_PC(Next_PC)
    );
    
    initial begin
        PC = 32'h00000000;
        #10;
        
        #10;
        
        PC = 32'h0000000F;
        #10;
        
        #10;
        
        PC = 32'h0000000C;
    end

    always @(PC or Next_PC)
        #1 $display ("At t = %0d PC = %h Next_PC = %h", $time, PC, Next_PC);


endmodule
