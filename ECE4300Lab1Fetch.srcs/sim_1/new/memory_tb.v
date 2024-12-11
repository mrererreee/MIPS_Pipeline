`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 02:06:41 PM
// Design Name: 
// Module Name: memory_tb
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


module memory_tb;
    
    reg clk;
    reg [31:0] addr;
    wire [31:0] data;
    
    memory mem(
        .clk(clk),
        .data(data),
        .addr(addr)
        );
        
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        addr = 0;
        #10;
        $display("Addr: %h, Data: %h", addr, data);
        
        addr = 3;
        #10;
        $display("Addr: %h, Data: %h", addr, data);
        
        addr = 7;
        #10
        $display("Addr: %h, Data: %h", addr, data);
        
        addr = 8;
        #10
        $display("Addr: %h, Data: %h", addr, data);
    end

endmodule
