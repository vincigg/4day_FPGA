`timescale 1ns/1ps

module tb_flipflop;
reg CLK_t;
reg D_t;
reg RST_t;

wire Q_t;


m_Dflipflop UUT(
        .CLK(CLK_t),
        .D(D_t),
        .RST(RST_t),
        .Q(Q_t)
    );
    
    
// at the start of the sim clock init
initial begin
    CLK_t = 0;
    forever #10 CLK_t = ~CLK_t; //clock period = 10 + 10ns 50Mhz
end

initial begin
    $monitor("Time = %0t ns: CLK = %b", $time, CLK_t);
    RST_t = 1'b0;
    D_t = 1'b0;
    
    
    #50 D_t = 1'b1;    
    #100 RST_t = 1'b1;
    #10 RST_t = 1'b0;
    #100 D_t = 1'b1;
end

endmodule