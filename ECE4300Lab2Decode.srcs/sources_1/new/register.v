`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 10:38:50 PM
// Design Name: 
// Module Name: register
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


module register(
    input wire [4:0] rs, rt, rd,
    input [31:0] writedata,
    output reg [31:0] A, B,
    input clk, reset, regwrite
);

    reg [31:0] registers[0:31];
    integer i;
    
    always @(*) begin
        A = registers[rs];
        B = registers[rd];
    end   
    
    always @(posedge clk or reset) begin
        if(reset) begin
            for(i = 0; i < 32; i = i + 1)
                registers[i] = 0;
        end
        if(rd != 0 && regwrite)
            registers[rd] <= writedata;
    end
    
endmodule
