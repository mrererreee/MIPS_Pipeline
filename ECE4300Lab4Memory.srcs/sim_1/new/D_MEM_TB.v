`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 03:10:35 PM
// Design Name: 
// Module Name: D_MEM_TB
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


module D_MEM_TB(

    );
    
    reg clk, reset;
    reg [31:0] address, write_data;
    reg memwrite, memread;
    wire [31:0] read_data;
    
    D_MEM uut (
        .address(address),
        .write_data(write_data),
        .memwrite(memwrite),
        .memread(memread),
        .read_data(read_data),
        .clk(clk),
        .reset(reset)
    );
    
    parameter T = 10;
    always begin
       clk = 1'b0;
       #(T/2); 
       clk = 1'b1;
       #(T/2);
    end 
    initial begin
       reset = 0;
       address = 32'h000000A; 
       memwrite = 1;
       write_data = 32'h001100;
       #(T);
       memwrite = 0;
       memread = 1; 
       #(T);
       memread = 0;
       memwrite = 1;
       address = 32'h000000B;
       write_data = 32'h001111;
       #(T);
       memwrite = 0;
       memread = 1;
       #(T);
       reset = 1;
       $finish;
    end
endmodule