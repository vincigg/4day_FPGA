`timescale 1ns/1ps

module tb_fulladder;

reg in1_t, in2_t, Cin_t;
wire S_t, Cout_t;

m_fulladder UUT(
    
    .A(in1_t),
    .B(in2_t),
    .Cin(Cin_t),
    .S(S_t),
    .Cout(Cout_t)
);

initial begin

    in1_t = 1'b0;
    in2_t = 1'b0;
    Cin_t = 1'b0;
    
    $monitor("time=%0t | A=%b B=%b Cin=%b | S=%b Cout=%b", 
              $time, in1_t, in2_t, Cin_t, S_t, Cout_t);
              
    #50       
    
    repeat(8)
        #50 {in1_t,in2_t,Cin_t} = {in1_t,in2_t,Cin_t} + 1'b1;   // i take them as 3 bits and do all the combinations
    $finish;
end

endmodule