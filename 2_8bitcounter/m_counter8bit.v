/*
FUNCTION TABLE : inspiration from TI SYNCHRONOUS 8-BIT UP/DOWN COUNTERS
    S1 S0 FUNCTION
    L L Clear
    L H Count down
    H L Load
    H H Count up
*/

module m_8bitcounter(
    input [1:0] S,
    input CLK,
    input EN,
    input [7:0] IN,
    output reg [7:0] OUT,
    output reg RCO //flag when counter reached max value
);

always @(posedge CLK)begin
    RCO = (OUT == 'hff)? 1'b1 : 1'b0;
    
    case(S)
        2'b00: begin
            OUT <= 0;
        end
        
        2'b01:begin
        
            if (EN) begin
                OUT <= OUT - 1'b1; //count down
            end
            
        end
        
        2'b10:begin
            OUT <= IN;
        end
        
        2'b11:begin
            
            if (EN) begin
                OUT <= OUT + 1'b1; //count up
            end
          
        end
     endcase 
end

always @(negedge CLK)
    RCO = (OUT == 'hff)? 1'b1 : 1'b0; //if out is max i set flag, negedge so i dont delay the flag

endmodule