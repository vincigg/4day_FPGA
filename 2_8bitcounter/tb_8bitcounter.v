`timescale 1ns/1ps
module tb_8bitcounter;

reg CLK_t, EN_t;
reg [1:0] S_t;
reg [7:0] IN_t;
wire [7:0] OUT_t;
wire RCO_t;

m_8bitcounter UUT(
    .CLK(CLK_t),
    .IN(IN_t),
    .OUT(OUT_t),
    .EN(EN_t),
    .RCO(RCO_t),
    .S(S_t)
);

/*
FUNCTION TABLE : inspiration from TI SYNCHRONOUS 8-BIT UP/DOWN COUNTERS
    S1 S0 FUNCTION
    L L Clear
    L H Count down
    H L Load
    H H Count up
*/

initial begin
    CLK_t = 1'b0;
    forever #5 CLK_t = ~CLK_t;
end

initial begin
    S_t = 2'b00;
    
    #8 //2ns before clock 1
    S_t = 2'b11; //start counting up from 0
    EN_t = 1'b1;
    
    
    #200
    S_t = 2'b00; // reset
    #10
    S_t = 2'b01; //start counting downwards
    #200
    
    IN_t =  'h96; //150
    S_t = 2'b10; //load
    #10
    S_t = 2'b11; //start counting up
    #200
    $finish;
end

endmodule