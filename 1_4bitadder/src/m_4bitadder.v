module m_4bitadder(A, B, Cin, S, Cout);

input [3:0] A, B;
input Cin;

output [3:0] S;
output Cout;

wire [3:0] C;

// I Take my previous module and istantiate it. I connect the pins for the lsb
m_fulladder m0(
    .A(A[0]),
    .B(B[0]),
    .Cin(Cin),
    .S(S[0]),
    .Cout(C[0])
);

m_fulladder m1(
    .A(A[1]),
    .B(B[1]),
    .Cin(C[0]),
    .S(S[1]),
    .Cout(C[1])
);

m_fulladder m2(
    .A(A[2]),
    .B(B[2]),
    .Cin(C[1]),
    .S(S[2]),
    .Cout(C[2])
);

m_fulladder m3(
    .A(A[3]),
    .B(B[3]),
    .Cin(C[2]),
    .S(S[3]),
    .Cout(Cout)
);


endmodule