`timescale 1ns/1ps

module tb_siporeg;

reg CLK_t;
reg SI_t, CLR_t;

wire [3:0] PO_t;

m_siporegister UUT(
    .CLK(CLK_t),
    .SI(SI_t),
    .PO(PO_t),
    .CLR(CLR_t)
);


//Clock def
initial begin
    CLK_t = 0;
    forever #5 CLK_t = ~CLK_t; //100MHz
end


//Sim
initial begin

    $monitor("Time = %0t ns: CLK = %B, SI = %b, PO = %b", $time,CLK_t, SI_t, PO_t);
    
    // Init register to 0000
    CLR_t = 1'b1;
    
    // before next clock posedge
    #8 CLR_t = 1'b0;
    // 1101
    SI_t = 1'b1;
    #10 SI_t = 1'b1;
    #10 SI_t = 1'b0;
    #10 SI_t = 1'b1;
    
    #10
    $finish;
end

endmodule