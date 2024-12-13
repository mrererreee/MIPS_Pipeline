`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 08:42:42 PM
// Design Name: 
// Module Name: adder
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

module adder (
    input wire [31:0] add_in1,  // 32-bit input 1
    input wire [31:0] add_in2,  // 32-bit input 2
    output wire [31:0] add_out  // 32-bit output
);

    assign add_out = add_in1 + add_in2;

endmodule

