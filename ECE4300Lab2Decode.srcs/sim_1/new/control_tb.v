`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 10:16:27 PM
// Design Name: 
// Module Name: control_tb
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


module control_tb;

    reg [5:0] opcode;
    wire [1:0] WB;
    wire [2:0] M;
    wire [3:0] EX;  
    
    control uut(
        .opcode(opcode),
        .WB(WB),
        .M(M),
        .EX(EX)
    );
    
    initial begin
        opcode = 6'b000_000;
        #10;
        
        opcode = 6'b100_011;
        #10;
        
        opcode = 6'b101_011;
        #10;
        
        opcode = 6'b000_100;
        #10;
        
        #20;
    end

endmodule
