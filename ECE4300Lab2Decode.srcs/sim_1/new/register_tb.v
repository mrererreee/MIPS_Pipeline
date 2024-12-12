`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 10:39:18 PM
// Design Name: 
// Module Name: register_tb
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


module register_tb;

    reg [4:0] rs, rt, rd;
    reg [31:0] writedata;
    wire [31:0] A, B;
    reg clk, reset, regwrite;
    
    register uut(
        .rs(rs), .rt(rt), .rd(rd),
        .writedata(writedata),
        .A(A), .B(B),
        .clk(clk), .reset(reset), 
        .regwrite(regwrite)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    initial begin
        reset = 1;
        regwrite = 0;
        #10;
        reset = 0;
        #10;
        
        // write
        rs = 5'd1; // writes to reg 1 reads as A
        rd = 5'd2; // writes to reg 2 reads as B
        writedata = 32'h00010011;
        regwrite = 1;
        #20;
        
        // read
        regwrite = 0;
        #10;
    end
    
endmodule
