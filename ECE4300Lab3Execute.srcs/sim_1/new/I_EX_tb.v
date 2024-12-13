`timescale 1ns / 1ps

module I_EX_tb;
    // Testbench signals
    reg clk;
    reg reset;
    reg [1:0] ctlwb_out;
    reg [2:0] ctlm_out;
    reg [4:0] instrout_1511, instrout_2016;
    reg [1:0] ALUop;
    reg RegDst;
    reg ALUSrc;
    reg [31:0] s_extendout, rdata1out, readdat2, npcout;
    
    // Outputs from the I_EX module
    wire [1:0] wb_ctlout;
    wire [2:0] m_ctlout;
    wire [4:0] five_bit_muxout;
    wire zero;
    wire [31:0] rdata2out, alu_result, add_result;

    // Instantiate the I_EX module
    I_EX uut (
        .clk(clk),
        .reset(reset),
        .ctlwb_out(ctlwb_out),
        .ctlm_out(ctlm_out),
        .instrout_1511(instrout_1511),
        .instrout_2016(instrout_2016),
        .ALUop(ALUop),
        .RegDst(RegDst),
        .ALUSrc(ALUSrc),
        .s_extendout(s_extendout),
        .rdata1out(rdata1out),
        .readdat2(readdat2),
        .npcout(npcout),
        .wb_ctlout(wb_ctlout),
        .m_ctlout(m_ctlout),
        .five_bit_muxout(five_bit_muxout),
        .zero(zero),
        .rdata2out(rdata2out),
        .alu_result(alu_result),
        .add_result(add_result)
    );

    always begin
        #5 clk = ~clk;  
    end

    initial begin
        clk = 0;
        reset = 1;
        ctlwb_out = 2'b00;
        ctlm_out = 3'b000;
        instrout_1511 = 5'b00000;
        instrout_2016 = 5'b00000;
        ALUop = 2'b00;
        RegDst = 0;
        ALUSrc = 0;
        s_extendout = 32'b0;
        rdata1out = 32'b0;
        readdat2 = 32'b0;
        npcout = 32'b0;

        #10 reset = 0;

        // check the outputs w sample values
        #10;
        ctlwb_out = 2'b01;
        ctlm_out = 3'b010;
        instrout_1511 = 5'b10101;
        instrout_2016 = 5'b11011;
        ALUop = 2'b01;
        RegDst = 1;
        ALUSrc = 1;
        s_extendout = 32'h0000FFFF;
        rdata1out = 32'h00000010;
        readdat2 = 32'h00000020;
        npcout = 32'h00000100;

        #20;

        // diff values
        #10;
        ctlwb_out = 2'b10;
        ctlm_out = 3'b001;
        instrout_1511 = 5'b11100;
        instrout_2016 = 5'b10001;
        ALUop = 2'b10;
        RegDst = 0;
        ALUSrc = 0;
        s_extendout = 32'hAAAA5555;
        rdata1out = 32'h00000001;
        readdat2 = 32'h00000002;
        npcout = 32'h00000000;

        #20;
        $finish;
    end

    initial begin
        $monitor("Time = %0t, wb_ctlout = %b, m_ctlout = %b, five_bit_muxout = %b, zero = %b, alu_result = %h, add_result = %h", 
                  $time, wb_ctlout, m_ctlout, five_bit_muxout, zero, alu_result, add_result);
    end
endmodule
