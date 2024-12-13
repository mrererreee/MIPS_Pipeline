`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 11:43:32 AM
// Design Name: 
// Module Name: if_id
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

/*
Implements an IF/ID pipeline register that inputs and outputs
the program counter and instruction.
*/

module if_id(
    input wire clk,
    output reg [31:0] instrout, npcout, // output of IF/ID instr AND NPC reg
    input wire [31:0] instr, npc // input of ^
);

    // register default values
    initial begin
        instrout <= 0;
        npcout <= 0;
    end

    always @(posedge clk) begin
        instrout <= instr;
        npcout <= npc;
    end
    
endmodule
