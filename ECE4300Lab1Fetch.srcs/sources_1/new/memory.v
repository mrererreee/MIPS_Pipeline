`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 11:36:38 AM
// Design Name: 
// Module Name: memory
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


module memory(
    input clk,
    output reg [31:0] data,
    input wire [31:0] addr
);

    // register declarations
    reg [31:0] MEM[0:127]; // 128 words of 32-bit memory, 128 rows of 32 columns
    
    initial begin
    // lab 1, assigning each slot of memory to a certain value
        MEM[0] <= 'hA00000AA;
        MEM[1] <= 'h10000011;
        MEM[2] <= 'h20000022;
        MEM[3] <= 'h30000033;
        MEM[4] <= 'h40000044;
        MEM[5] <= 'h50000055;
        MEM[6] <= 'h60000066;
        MEM[7] <= 'h70000077;
        MEM[8] <= 'h80000088;
        MEM[9] <= 'h90000099;
    end
    
    always @(posedge clk) data <= MEM[addr];
    
endmodule
