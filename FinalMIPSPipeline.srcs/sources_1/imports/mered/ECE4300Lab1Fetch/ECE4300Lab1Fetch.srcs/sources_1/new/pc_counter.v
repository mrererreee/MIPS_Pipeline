`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 11:33:57 AM
// Design Name: 
// Module Name: pc_counter
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


module pc_counter(
    output reg [31:0] PC,
    input wire [31:0] npc,
    input clk
);

    initial begin
        PC <= 0;
    end
    
    always @(posedge clk) begin
        PC <= npc;
    end

endmodule
