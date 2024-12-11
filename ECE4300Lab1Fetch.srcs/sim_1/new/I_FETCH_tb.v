`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 02:55:05 PM
// Design Name: 
// Module Name: I_FETCH_tb
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


module I_FETCH_tb;

    reg clk;
    reg EX_MEM_PCSrc;
    reg [31:0] EX_MEM_NPC;
    wire [31:0] IF_ID_instr;
    wire [31:0] IF_ID_npc;

    I_FETCH uut( 
        .clk(clk), 
        .EX_MEM_PCSrc(EX_MEM_PCSrc), 
        .EX_MEM_NPC(EX_MEM_NPC), 
        .IF_ID_instr(IF_ID_instr), 
        .IF_ID_npc(IF_ID_npc)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;  
    end

    initial begin
        EX_MEM_PCSrc = 0;
        EX_MEM_NPC = 32'h00000004;  // next program counter value

        #10 
        EX_MEM_PCSrc = 0;  // output default npc value
        
        #10 
        EX_MEM_PCSrc = 1;  // branch/jump?
        EX_MEM_NPC = 32'h00000008;  // change next PC value
        
        #10 
        EX_MEM_PCSrc = 0;  // back to output default incr. pc value
        
        #10 
        EX_MEM_PCSrc = 1;  // branch/jump of next PC value
        EX_MEM_NPC = 32'h0000000C;  


        #60 $finish;
    end
    
    initial begin
        $display("Time\tPCSrc\tEX_MEM_NPC\tIF_ID_instr\tIF_ID_npc");
        $monitor("%0t\t%b\t%h\t%h\t%h", $time, EX_MEM_PCSrc, EX_MEM_NPC, IF_ID_instr, IF_ID_npc);
    end


endmodule
