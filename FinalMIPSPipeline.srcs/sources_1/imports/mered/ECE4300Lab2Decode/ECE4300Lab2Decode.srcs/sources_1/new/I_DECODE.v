`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 01:45:01 AM
// Design Name: 
// Module Name: I_DECODE
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


module I_DECODE(
    input clk, reset,
    input [31:0] IF_ID_instr, IF_ID_npc,
    input [31:0] writedata,
    input [5:0] rd,
    input regwrite,
    
    output [1:0] wb_ctlout,
    output [2:0] m_ctlout,
    output [3:0] ex_ctlout,
    output [31:0] npcout, rdata1out, rdata2out, s_extendout,
    output [4:0] instrout_1511, instrout_2016    
);

    wire [1:0] WB;
    wire [2:0] M;
    wire [3:0] EX;
    
    wire [31:0] A, B;
    
    // for sign extend module
    wire [31:0] IF_ID_instr_ext;

    control control1 (
        .opcode(IF_ID_instr[31:26]),
        .WB(WB),
        .M(M),
        .EX(EX)
    );

    register reg_file (
        .rs(IF_ID_instr[25:21]),
        .rd(rd),
        .rt(IF_ID_instr[20:16]),
        .writedata(writedata),
        .regwrite(1),
        .A(A),
        .B(B),
        .clk(clk),
        .reset(reset)
    );
    
    sign_extend s_extend (
        .IF_ID_instr(IF_ID_instr[15:0]),
        .IF_ID_instr_out(IF_ID_instr_ext[31:0])
    );
    
    id_ex id_ex_latch (
        .ctlwb_out(WB),
        .ctlm_out(M),
        .ctlex_out(EX),
        .npc(IF_ID_npc),
        .readdat1(A),
        .readdat2(B),
        .signext_out(IF_ID_instr_ext[31:0]),
        .instr_1511(IF_ID_instr[15:11]), 
        .instr_2016(IF_ID_instr[20:16]),
        .wb_ctlout(wb_ctlout),
        .m_ctlout(m_ctlout),
        .ex_ctlout(ex_ctlout),
        .npcout(npcout),
        .rdata1out(rdata1out),
        .rdata2out(rdata2out),
        .s_extendout(s_extendout),
        .instrout_1511(instrout_1511),
        .instrout_2016(instrout_2016),
        .clk(clk),
        .reset(reset)
    );        

endmodule
