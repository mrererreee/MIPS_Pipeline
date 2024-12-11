`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 11:53:20 AM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb;
    
    reg [31:0] a, b;
    reg sel;
    
    wire [31:0] y;
    
    mux uut (
        .y(y),
        .a(a),
        .b(b),
        .sel(sel)
    );
    
    initial begin
        a = 32'hAAAAAAAA;
        b = 32'h55555555;
        sel = 1'b1;
        #10;
        
        a = 32'h00000000;
        
        #10;
        
        sel = 1'b1;
        #10;
        
        b = 32'hFFFFFFFF;
        #5;
        
        a = 32'hA5A5A5A5;
        #5;
        
        sel = 1'b0;
        b = 32'hDDDDDDDD;
        
        #5;
        
        sel = 1'bx;
    end
    
    always @(a or b or sel)
        #1 $display ("At t = %8d sel = %b a = %h y = %h", $time, sel, a, b, y);
    
endmodule
