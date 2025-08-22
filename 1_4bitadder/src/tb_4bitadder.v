`timescale 1ns/1ps

module tb_4bitadder;

reg [3:0] in1_t, in2_t;
reg Cin_t;
reg [8:0] i;

wire [3:0] S_t;
wire Cout_t;

m_4bitadder UUT(
    .A(in1_t),
    .B(in2_t),
    .Cin(Cin_t),
    .S(S_t),
    .Cout(Cout_t)
);

initial begin
   
    in1_t = 4'b0000;
    in2_t = 4'b0000;
    Cin_t = 1'b0;
    
    $monitor("time=%0t | A=%d B=%d Cin=%b | S=%d Cout=%b", 
              $time, in1_t, in2_t, Cin_t, S_t, Cout_t);
    
    #5
    
    //the maximum number of combinations are 4bits for in1, 4 for in2, 1 for cin
   
    for(i = 0; i < 512; i = i+1) begin
        #1
        Cin_t  = i[8];       // bit 8
        in1_t  = i[7:4];     // bits 7–4
        in2_t  = i[3:0];     // bits 3–0
    end
    
    $display("Finished"); //the sim may end earlier depending on simulation settings on vivado
    $finish;
end


endmodule