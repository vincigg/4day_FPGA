module m_ffjk(J,K, CLK, RST, Q, Qbar);

input J,K,CLK, RST;
output reg Q;
output Qbar;

always @(posedge CLK) begin

    if (RST) begin
        Q <= 1'b0;
    end
    else begin
        case({J,K})
            2'b00: Q <= Q; //hold
            2'b01: Q <= 0;
            2'b10: Q <= 1;
            2'b11: Q <= ~Q;
            default: Q <= Q;
        endcase
    end
end

assign Qbar = ~Q;

endmodule