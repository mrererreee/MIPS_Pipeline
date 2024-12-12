module I_DECODE_tb;

    reg clk;
    reg reset;
    reg [31:0] IF_ID_instr;
    reg [31:0] IF_ID_npc;
    reg [31:0] writedata;
    reg [5:0] rd;
    reg regwrite;
    
    wire [1:0] wb_ctlout;
    wire [3:0] ex_ctlout;
    wire [31:0] npcout, rdata1out, rdata2out, s_extendout;
    wire [4:0] instrout_1511, instrout_2016;

    // Instantiate the I_DECODE module
    I_DECODE uut (
        .clk(clk),
        .reset(reset),
        .IF_ID_instr(IF_ID_instr),
        .IF_ID_npc(IF_ID_npc),
        .writedata(writedata),
        .rd(rd),
        .regwrite(regwrite),
        .wb_ctlout(wb_ctlout),
        .ex_ctlout(ex_ctlout),
        .npcout(npcout),
        .rdata1out(rdata1out),
        .rdata2out(rdata2out),
        .s_extendout(s_extendout),
        .instrout_1511(instrout_1511),
        .instrout_2016(instrout_2016)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end

       initial begin
            reset = 0;
            // test case for following instruction
            /*
                opcode: 000000
                readreg1 / rs: 11011
                readreg2 / rt: 01110
                instr2016 into ex mux + sign extend
                --> 1000101101101100
             */
            IF_ID_instr = 32'h36E8B6C; 
            IF_ID_npc = 32'h000ABC;
            rd = 5'b11011; // write register address
            writedata = 32'b1100; 
            regwrite = 0; // enable off
            
            #10;
            regwrite = 1; // enable on to write
            
            #10;
            regwrite = 0;
            rd = 5'b01110;
            writedata = 32'b1110;
            
            #10;
            regwrite = 1;
            
            #10;
            regwrite = 0;
            IF_ID_instr = 32'h8F6E8B6C; // testing control opcode: lw
            
            #20;
            IF_ID_instr = 32'hAF6E8B6C; // sw
            
            #20;
            IF_ID_instr=  32'h136E8B6C; // beq
            
            #20;
           $finish;
    end

endmodule
