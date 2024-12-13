`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 10:00:09 PM
// Design Name: 
// Module Name: control
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


module control(
    input [5:0] opcode,
    output reg [1:0] WB,
    output reg [2:0] M,
    output reg [3:0] EX
);
    parameter [5:0] RTYPE = 6'b000_000;
    parameter [5:0] lw = 6'b100_011;
    parameter [5:0] sw = 6'b101_011;
    parameter [5:0] beq = 6'b000_100;
    
    always @* begin
        EX <= 4'b0000;
        M <= 3'b000;
        WB <= 2'b00;
        case(opcode)
            RTYPE: begin
                EX = 4'b1100;
                M = 3'b000;
                WB = 2'b10;
            end
            lw: begin
                EX <= 4'b0001;
                M <= 3'b010;
                WB <= 2'b11;
            end
            sw: begin
                EX <= 4'bx001;
                M <= 3'b001;
                WB <= 2'b0x;
            end
            beq: begin
                EX <= 4'bx010;
                M <= 3'b100;
                WB <= 2'b0x;
            end
            default: begin
                EX <= 4'b0000;
                M <= 3'b000;
                WB <= 2'b00;
            end            
        endcase
    end
    
endmodule
