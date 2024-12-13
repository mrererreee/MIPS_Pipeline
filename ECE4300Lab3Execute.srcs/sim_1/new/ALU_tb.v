`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 12:44:46 AM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;

    reg [31:0] A, B;
    reg [2:0] control;
    wire zero;
    wire [31:0] result;

    ALU alu_unit(
        .A(A), .B(B),
        .control(control),
        .zero(zero),
        .result(result)
    );
    
    initial begin
        A = 32'h0000FFFF; 
        B = 32'hFFFF0000;

        #10; 
        control = 3'b000; // AND
        
        #10; 
        A = 32'h00000001;
        B = 32'h00000002;
        control = 3'b010; // ADD
        
        #10; 
        control = 3'b111; // SLT
    end


endmodule
