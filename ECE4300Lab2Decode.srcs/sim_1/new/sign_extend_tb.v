`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 09:33:14 PM
// Design Name: 
// Module Name: sign_extend_tb
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


module sign_extend_tb;

    reg [15:0] IF_ID_instr;
    wire [31:0] IF_ID_instr_out;
    
    sign_extend uut(
        .IF_ID_instr(IF_ID_instr),
        .IF_ID_instr_out(IF_ID_instr_out)
    );
    
    initial begin
        // sends a positive
        IF_ID_instr = 16'h0004;
        #10;
        
        // sends a negative
        IF_ID_instr = 16'hA000;
        #10;
        
        IF_ID_instr = 16'hFFFF;
        #10; 
    end

endmodule
