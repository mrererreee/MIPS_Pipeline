`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 12:57:51 AM
// Design Name: 
// Module Name: id_ex_tb
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


module id_ex_tb;

    reg clk;
    reg [1:0] ctlwb_out;
    reg [2:0] ctlm_out;
    reg [3:0] ctlex_out;
    reg [31:0] npc, readdat1, readdat2, signext_out;
    reg [4:0] instr_2016, instr_1511;
    
    wire [1:0] wb_ctlout;
    wire [2:0] m_ctlout;
    wire [3:0] ex_ctlout;
    wire [31:0] npcout, rdata1out, rdata2out, s_extendout;
    wire [4:0] instrout_2016, instrout_1511;

    id_ex uut(
        .clk(clk),
        .ctlwb_out(ctlwb_out),
        .ctlm_out(ctlm_out),
        .ctlex_out(ctlex_out),
        .npc(npc), .readdat1(readdat1), 
        .readdat2(readdat2), .signext_out(signext_out),
        .instr_2016(instr_2016), .instr_1511(instr_1511),
        .wb_ctlout(wb_ctlout),
        .m_ctlout(m_ctlout),
        .ex_ctlout(ex_ctlout),
        .npcout(npcout), .rdata1out(rdata1out), 
        .rdata2out(rdata2out), .s_extendout(s_extendout),
        .instrout_2016(instrout_2016), .instrout_1511(instrout_1511) 
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        #10 
            ctlwb_out = 2'b00;
            ctlm_out = 3'b000;
            ctlex_out = 4'b0000;
            npc = 32'h00000000;
            readdat1 = 32'h00000000;
            readdat2 = 32'h00000000;
            signext_out = 32'h00000000;
            instr_2016 = 5'b00000;
            instr_1511 = 5'b00000;
            
        #10
            ctlwb_out = 2'b01;
            ctlm_out = 3'b011;
            ctlex_out = 4'b1010;
            npc = 32'h00000011;
            readdat1 = 32'h00008200;
            readdat2 = 32'hAA000000;
            signext_out = 32'hCC00000C;
            instr_2016 = 5'b10110;
            instr_1511 = 5'b00111;
    end
    
    // using this to check
    initial begin
        $monitor("Time = %0dns, clk = %b, ctlwb_out = %b, ctlm_out = %b, ctlex_out = %b, npc = %h, readdat1 = %h, readdat2 = %h, signext_out = %h, instr_2016 = %b, instr_1511 = %b, wb_ctlout = %b, m_ctlout = %b, ex_ctlout = %b, npcout = %h, rdata1out = %h, rdata2out = %h, s_extendout = %h, instrout_2016 = %b, instrout_1511 = %b", 
        $time, clk, ctlwb_out, ctlm_out, ctlex_out, npc, readdat1, readdat2, signext_out, instr_2016, instr_1511, 
             wb_ctlout, m_ctlout, ex_ctlout, npcout, rdata1out, rdata2out, s_extendout, instrout_2016, instrout_1511);
    end


endmodule
