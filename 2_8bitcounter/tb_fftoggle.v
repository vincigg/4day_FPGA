`timescale 1ns/1ps
module tb_fftoggle;

reg CLK_t, T_t, RST_t;
wire Q_t;

m_ffjk UUT(
    .J(T_t),
    .K(T_t),
    .RST(RST_t),
    .CLK(CLK_t),
    .Q(Q_t)
);


initial begin
    CLK_t = 0;
    forever #5 CLK_t = ~CLK_t; // 10Mhz
end

initial begin
    $monitor("Time = %d, CLK = %b, T=%b, Q = %b", $time, CLK_t, T_t, Q_t);
    T_t = 1'b0;
    RST_t = 1'b1;
    
    #8
    RST_t = 1'b0;
    
    repeat(8)
        #10 T_t = ~T_t;
    
    #5 $finish;
    
end

endmodule