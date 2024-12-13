`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 09:57:10 AM
// Design Name: 
// Module Name: I_MEMORY_tb
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


module I_MEMORY_tb(

    );
    
    reg [31:0] address, write_data; // DMEM
    reg m_ctlout, zero; // AND Gate
    reg [4:0] write_reg_in; // 5 bit mux
    reg [1:0] control_wb_in;
    reg memwrite, memread; // DMEM
    wire [31:0] read_data, mem_ALU_result;
    wire [1:0] mem_control_wb;
    wire [4:0] mem_write_reg;
    wire PCSrc;
    reg clk, reset;
    
    MEMORY uut (
        .address(address),
        .write_data(write_data),
        .m_ctlout(m_ctlout),
        .zero(zero),
        .write_reg_in(write_reg_in),
        .control_wb_in(control_wb_in),
        .memwrite(memwrite),
        .memread(memread),
        .read_data(read_data),
        .mem_ALU_result(mem_ALU_result),
        .mem_control_wb(mem_control_wb),
        .mem_write_reg(mem_write_reg),
        .PCSrc(PCSrc),
        .clk(clk),
        .reset(reset)
    );
    
    parameter T = 10;
    always begin
       clk = 1'b0;
       #(T/5); 
       clk = 1'b1;
       #(T/5);
    end 
    initial begin
        reset = 0;
        address = 32'h000000A; 
        memwrite = 1;
        write_data = 32'h001100;
        control_wb_in = 2'b00;
        write_reg_in = 5'b00110;
        m_ctlout = 1;
        zero = 0;
        #(T);
        memwrite = 0;
        memread = 1;
        zero = 1;
        #(T);
        memread = 0;
        memwrite = 1;
        address = 32'h000000B;
        write_data = 32'h001111;
        control_wb_in = 2'b01; 
        write_reg_in = 5'b00111;
        #(T);
        memwrite = 0;
        memread = 1;
        m_ctlout = 0;
        #(T);
        reset = 1;
        $finish;
    end
endmodule