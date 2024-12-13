`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 07:59:52 PM
// Design Name: 
// Module Name: PIPELINE
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


module pipeline_compl(
    input clk, reset
    );
    
    wire [31:0] IF_ID_instr;
    wire [31:0] IF_ID_NPC;
    
    I_FETCH i_fetch (
        .IF_ID_instr(IF_ID_instr),
        .IF_ID_npc(IF_ID_NPC),
        .EX_MEM_PCSrc(PCSrc),
        .EX_MEM_NPC(add_result),
        .clk(clk)
    );
    
    wire [1:0] wb_ctlout_d;
    wire [2:0] m_ctlout_d;
    wire [3:0] ex_ctlout;
    wire [31:0] npcout, rdata1out, rdata2out_d, s_extendout;
    wire [5:0] instrout_1511, instrout_2016;
    
    I_DECODE i_decode (
        .IF_ID_instr(IF_ID_instr[31:0]),
        .IF_ID_npc(IF_ID_NPC[31:0]),
        .writedata(writedata),
        .rd(mem_write_reg),
        .regwrite(mem_control_wb[1]),
        .wb_ctlout(wb_ctlout_d),
        .m_ctlout(m_ctlout_d),
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
    

    wire [1:0] wb_ctlout_ex;
    wire [2:0] m_ctlout_ex;
    wire [31:0] rdata2out_ex;
    wire [4:0] five_bit_muxout;
    wire [31:0] alu_result, add_result;
    wire zero;
    
    I_EX i_execute (
        .ctlwb_out(wb_ctlout_d),
        .wb_ctlout(wb_ctlout_ex),
        .ctlm_out(m_ctlout_d),
        .m_ctlout(m_ctlout_ex),
        .ALUop(ex_ctlout[2:1]),
        .RegDst(ex_ctlout[0]),
        .ALUSrc(ex_ctlout[3]),
        .instrout_1511(instrout_1511),
        .instrout_2016(instrout_2016),
        .five_bit_muxout(five_bit_muxout),
        .zero(zero),
        .rdata2out(rdata2out_ex),
        .alu_result(alu_result),
        .add_result(add_result),
        .s_extendout(s_extendout),
        .rdata1out(rdata1out),
        .readdat2(rdata2out_d),
        .npcout(npcout),
        .clk(clk),
        .reset(reset)
    );
    
    wire [31:0] read_data_mem, mem_ALU_result;
    wire [4:0] mem_write_reg;
    wire [1:0] mem_control_wb;
    wire PCSrc; 
    
    MEMORY i_memory (
        .address(alu_result),
        .write_data(rdata2out_ex),
        .m_ctlout(m_ctlout_ex[0]),
        .zero(zero),
        .write_reg_in(five_bit_muxout),
        .control_wb_in(wb_ctlout_ex),
        .memwrite(m_ctlout_ex[1]),
        .memread(m_ctlout_ex[2]),
        .read_data(read_data_mem),
        .mem_ALU_result(mem_ALU_result),
        .mem_control_wb(mem_control_wb),
        .mem_write_reg(mem_write_reg),
        .PCSrc(PCSrc),
        .clk(clk),
        .reset(reset)
    );
    
    wire [31:0] writedata; 
    
    I_WB wb_mux (
        .wb_data(writedata),
        .mem_read_data(read_data_mem),
        .mem_ALU_result(mem_ALU_result),
        .memtoreg(mem_control_wb[0])
    );
endmodule