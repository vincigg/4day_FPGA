`timescale 1ns/1ps

module tb_pwm;

reg CLK_t, EN_t;
reg [7:0] value_t;
wire SO_t;


m_pwm UUT(
    .CLK(CLK_t),
    .SO(SO_t),
    .EN(EN_t),
    .limit_value(value_t)
);

initial begin
    CLK_t = 1'b0;
    forever #1 CLK_t = ~CLK_t; //50mhz
end

initial begin
    EN_t = 1'b1;
    value_t = 'd128; //aim for 0.5 dutyc
end

endmodule