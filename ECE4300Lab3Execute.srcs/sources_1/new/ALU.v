`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 10:17:00 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A, B,
    input [2:0] control,
    output reg zero,
    output reg [31:0] result
);

    always @(*) begin
    
        case(control)
            3'b000: result = A & B;
            3'b001: result = A | B;
            3'b010: result = A + B;
            3'b110: result = A - B;
            3'b111: result = (A < B) ? 32'b1 : 32'b0;
            default: result = 32'b0;
        endcase
        
        zero = (result == 32'b0) ? 1'b1 : 1'b0;
        
    end

endmodule
