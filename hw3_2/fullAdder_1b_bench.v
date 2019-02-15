module fullAdder_1b_bench;

    reg A;
    reg B;
    reg[1:0] Sumcalc;
    reg C_in;
    wire        SUM;
    wire        CO;
    wire        Clk;
    //2 dummy wires
    wire rst;
    wire err;
    clkrst my_clkrst( .clk(Clk), .rst(rst), .err(err));
    fullAdder_1b DUT (.A(A), .B(B), .C_in(C_in),.S(SUM), .C_out(CO));
  
    initial begin
        A = 2'b0;
        B = 2'b0;
        C_in = 1'b0;
        #3200 $finish;
    end
   
    always@(posedge Clk) begin
        A = $random;
        B = $random;
        C_in = $random;
    end
   
    always@(negedge Clk) begin
        Sumcalc = A+B+C_in;
        $display("A: %x, B: %x, C_in: %x, Sum: %x", A, B, C_in, SUM);
    
        if (Sumcalc[0] !== SUM) $display ("ERRORCHECK Sum error");
        if (Sumcalc[1] !== CO) $display ("ERRORCHECK CO error");
    end
endmodule // rca_16b_bench
