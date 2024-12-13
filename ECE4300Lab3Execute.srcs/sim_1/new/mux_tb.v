module mux_tb;
    reg [4:0] a, b;
    reg sel;
    
    wire [4:0] y;
    
    mux uut (
        .y(y),
        .a(a),
        .b(b),
        .sel(sel)
    );
    
    initial begin
        a = 4'b1001;
        b = 4'b0001;
        sel = 1'b1;
        #10;
        
        a = 4'b1111;
        
        #10;
        
        sel = 1'b1;
        #10;
        
        b = 4'b0011;
        #5;
        
        a = 4'b0000;
        #5;
        
        sel = 1'b0;
        b = 4'b0101;
        
        #5;
        
        sel = 1'bx;
    end
    
    always @(a or b or sel)
        #1 $display ("At t = %8d sel = %b a = %h y = %h", $time, sel, a, b, y);
endmodule