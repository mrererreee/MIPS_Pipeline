module adder_tb;

    reg [31:0] add_in1;  
    reg [31:0] add_in2;  
    wire [31:0] add_out; 
    
    adder add(
        .add_in1(add_in1),  
        .add_in2(add_in2),  
        .add_out(add_out)  
    );

    initial begin
        add_in1 = 32'd1;
        add_in2 = 32'd2;
        
        #10
        add_in1 = 32'd7;
        add_in2 = 32'd154;
    end

endmodule