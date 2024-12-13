module ALU_control_tb;

    reg [5:0] funct;
    reg [1:0] alu_op;
    wire [2:0] select;
    
    ALU_control uut(
        .funct(funct),
        .alu_op(alu_op),
        .select(select)
    );
    
    
    initial begin
        alu_op = 2'b00; // lw/sw 
        funct = 6'b000_000; // irrelevant for lw/sw

        #10; 
        $display("alu_op: %b, funct: %b, select: %b", alu_op, funct, select);
        
        alu_op = 2'b01; // beq 
        #10;
        $display("alu_op: %b, funct: %b, select: %b", alu_op, funct, select);
        
        alu_op = 2'b10; // R-type 
        funct = 6'b100_000; // add
        #10;
        $display("alu_op: %b, funct: %b, select: %b", alu_op, funct, select);
        
        #10
        $finish;        
    end
    
endmodule