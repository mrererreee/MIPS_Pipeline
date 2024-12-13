`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 01:17:13 PM
// Design Name: 
// Module Name: I_FETCH
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


module I_FETCH( 
// wire to transfer data, reg to store data
    input clk,
    output wire [31:0] IF_ID_instr,
    output wire [31:0] IF_ID_npc,
    input wire         EX_MEM_PCSrc,
    input wire  [31:0] EX_MEM_NPC
);

    wire [31:0] PC;
    wire [31:0] dataout;
    wire [31:0] npc, npc_mux;
    
    mux1 mux12(
        .y(npc_mux),
        .a(EX_MEM_NPC),
        .b(npc),
        .sel(EX_MEM_PCSrc)
    );
    
    pc_counter pc_counter1( 
        .clk(clk),
        .PC(PC),
        .npc(npc_mux)
    );
    
    memory1 memory12(
        .clk(clk),
        .data(dataout), // output
        .addr(PC)       // input
    );
    
    if_id if_id1(
        .clk(clk),
        .instr(dataout),        // inputs
        .npc(npc),
        .instrout(IF_ID_instr), // outputs
        .npcout(IF_ID_npc)
    );
    
    incrementer incrementer1(
        .Next_PC(npc), // output
        .PC(PC)        // input
    );

/*    initial begin
        $display("Time\t PC\t npc\t dataout of MEM\t IF_ID_instr\t IF_ID_npc");
        $monitor("%0d\t %0d\t %0d\t %b\t %b\t %0d", $time, PC, npc, dataout, IF_ID_instr, IF_ID_npc);
        #24 $finish;
    end */
    
endmodule
