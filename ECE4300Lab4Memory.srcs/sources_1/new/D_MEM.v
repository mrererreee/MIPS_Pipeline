`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2024 10:07:15 AM
// Design Name: 
// Module Name: D_MEM
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


module D_MEM(
    input [31:0] address, write_data,
    output reg [31:0] read_data,
    input memwrite, memread,
    input clk, reset
    );
    
    reg [31:0] DMEM[0:255];
    
    integer i;
    always@(posedge clk)
    begin
        if(reset)
        begin
            read_data <= 0;
            for (i = 0; i < 32; i = i + 1)
            begin
                DMEM[i] = 0;
            end
        end    
        else
        begin
            if(memwrite && memread)
            begin
                DMEM[address] <= write_data;
            end
            else if (memwrite)
                DMEM[address] <= write_data;
            else if (memread)
                read_data <= DMEM[address];    
        end    
    end
    
    integer i;
    initial begin
        $readmemb("data.txt", DMEM);
        for(i = 0; i < 6; i = i + 1)
            $display(DMEM[i]);
    end
endmodule