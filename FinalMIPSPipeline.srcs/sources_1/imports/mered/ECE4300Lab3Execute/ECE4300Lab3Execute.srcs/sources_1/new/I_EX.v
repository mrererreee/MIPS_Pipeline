`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 11:49:53 PM
// Design Name: 
// Module Name: I_EX
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


module I_EX(
    input clk, reset,
    input [1:0] ctlwb_out,
    input [2:0] ctlm_out,
    // inputs to mux
    input [4:0] instrout_1511, instrout_2016,
    // inputs from decode
    input [1:0] ALUop,
    input RegDst,
    input ALUSrc,
    // rest
    input [31:0] s_extendout, rdata1out,
    readdat2, npcout,
    
    output [1:0] wb_ctlout,
    output [2:0] m_ctlout,
    output [4:0] five_bit_muxout,
    output zero,
    output [31:0] rdata2out, alu_result, add_result   
);

    wire [31:0] adder_out;
    wire [2:0] sel;
    wire aluzero;
    wire [31:0] aluout;
    wire [4:0] mux_out;
    
    adder adder1 (
        .add_in1(npcout),
        .add_in2(s_extendout),
        .add_out(adder_out)
    );
    
    ALU_control control(
        .funct(s_extendout[5:0]),
        .alu_op(ALUop),
        .select(sel)
    );

    ALU alu_unit(
        .A(rdata2out),
        .B(s_extendout),
        .control(sel),
        .zero(aluzero),
        .result(aluout)
    );
    
    mux3 multiplexer(
        .a(instrout_2016),
        .b(instrout_1511),
        .y(mux_out),
        .sel(RegDst)
    );
    
    ex_mem latch(
       .ctlwb_out(ctlwb_out),
       .ctlm_out(ctlm_out),
       .adder_out(adder_out),
       .aluout(aluout),
       .readdat2(readdat2),
       .aluzero(aluzero),
       .muxout(mux_out),
       .wb_ctlout(wb_ctlout),
       .m_ctlout(m_ctlout),
       .add_result(add_result),
       .alu_result(alu_result),
       .rdata2out(rdata2out),
       .zero(zero),
       .five_bit_muxout(five_bit_muxout),
       .clk(clk),
       .reset(reset)        
    );

endmodule
