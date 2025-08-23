module m_Dflipflop(D,CLK,RST,Q,Qbar);

input D, CLK, RST;
output reg Q; //need to store it
output Qbar;

always @(posedge CLK or posedge RST) begin //every positive edge of the clock
    
    if (RST==1) begin
        Q<=0; //assignment scheduled after the sim step
    end
    else begin
        Q <= D; //store into Q the value of D
    end
 
end

not(Qbar, Q); // Qbar is not Q

endmodule