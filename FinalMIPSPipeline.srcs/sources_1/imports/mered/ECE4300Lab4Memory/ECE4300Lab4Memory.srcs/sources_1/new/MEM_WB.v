`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2024 10:07:37 AM
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
    input [1:0] control_wb_in,
    input [31:0] read_data_in, ALU_result_in,
    input [4:0] write_reg_in,
    output reg [1:0] mem_control_wb,
    output reg [31:0] read_data, mem_ALU_result,
    output reg [4:0] mem_write_reg,
    input clk, reset
    );
    
    initial begin // initialize everything to 0
        mem_control_wb = 0;
        read_data = 0;
        mem_ALU_result = 0;
        mem_write_reg = 0;
    end
    
    always @(posedge clk || reset)
    begin
        if(reset)
        begin
            mem_control_wb <= 0;
            read_data <= 0;
            mem_ALU_result <= 0;
            mem_write_reg <= 0;
        end
        else
        begin
            mem_control_wb <= control_wb_in;
            read_data <= read_data_in;
            mem_ALU_result <= ALU_result_in;
            mem_write_reg <= write_reg_in;
        end
    end
    
endmodule