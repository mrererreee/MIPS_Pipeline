module ex_mem_tb;

    reg clk, reset;
    reg [1:0] ctlwb_out;
    reg [2:0] ctlm_out;
    reg [31:0] adder_out, aluout, readdat2;
    reg aluzero;
    reg [4:0] muxout;
    
    wire [1:0] wb_ctlout;
    wire [2:0] m_ctlout;
    wire [31:0] add_result, alu_result, rdata2out;
    wire zero;
    wire [4:0] five_bit_muxout;
    
    ex_mem latch(
        .clk(clk), .reset(reset),
        .ctlwb_out(ctlwb_out),
        .ctlm_out(ctlm_out),
        .adder_out(adder_out), .aluout(aluout), .readdat2(readdat2),
        .aluzero(aluzero),
        .muxout(muxout),
        
        .wb_ctlout(wb_ctlout),
        .m_ctlout(m_ctlout),
        .add_result(add_result), .alu_result(alu_result), .rdata2out(rdata2out),
        .zero(zero),
        .five_bit_muxout(five_bit_muxout)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin 
        reset = 0;
        ctlwb_out = 2'b11;
        ctlm_out = 3'b101;
        adder_out = 32'b000101;
        aluout = 32'b001111;
        aluzero = 0;
        readdat2 = 32'b001010;
        muxout = 5'b11011;
        #10;        
    end
    
endmodule