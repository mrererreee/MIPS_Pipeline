`timescale 1ns / 1ps

module I_WB_tb;

    reg [31:0] mem_read_data;
    reg [31:0] mem_ALU_result;
    reg memtoreg;

    wire [31:0] wb_data;

    I_WB uut (
        .wb_data(wb_data),
        .mem_read_data(mem_read_data),
        .mem_ALU_result(mem_ALU_result),
        .memtoreg(memtoreg)
    );

    initial begin
        mem_read_data = 32'hAAAA5555;  
        mem_ALU_result = 32'h12345678; 
        memtoreg = 1;                 
        #10;                          

        memtoreg = 0;                  
        #10;                           

    end
endmodule