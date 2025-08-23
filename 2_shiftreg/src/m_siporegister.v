module m_siporegister(SI, CLK, CLR, PO);

input SI, CLK, CLR;   //SI serial input, CLK clock, CLR clear
/*
    Shift Mode: In shift mode, the input data is serially shifted through the flip-flops. 
    The data bit at the serial input enters the first flip-flop, while the existing data bits are shifted to subsequent flip-flops. 
    This mode is useful when serial data needs to be processed sequentially.
*/

output [3:0] PO; // PO parallel out

wire [3:0] Q;

m_Dflipflop f0(
    .CLK(CLK),
    .RST(CLR),
    .D(SI),
    .Q(Q[0])
);


m_Dflipflop f1(
    .CLK(CLK),
    .RST(CLR),
    .D(Q[0]),
    .Q(Q[1])
);


m_Dflipflop f2(
    .CLK(CLK),
    .RST(CLR),
    .D(Q[1]),
    .Q(Q[2])
);


m_Dflipflop f3(
    .CLK(CLK),
    .RST(CLR),
    .D(Q[2]),
    .Q(Q[3])
);

assign PO = Q;

endmodule