module m_pwm(
    input [7:0] limit_value, //value that defines the pulse width, 256 = 100% duty 
    input CLK,
    input EN,
    output reg SO   //signal out
);

reg [1:0] S = 2'b00; //initial clear
wire [7:0] triang;

m_8bitcounter c0(
    .CLK(CLK),
    .S(S),
    .EN(EN),
    .OUT(triang)
);

always @(posedge CLK) begin
    if (EN) begin
        S = 2'b11; //count upwards
        
        if (triang < limit_value)
            SO = 1'b1;
        else
            SO = 1'b0;
    end
end


endmodule