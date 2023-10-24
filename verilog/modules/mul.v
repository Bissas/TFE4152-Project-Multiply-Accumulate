`include "../modules/half_adder.v"

module mul(
    input [1:0] A,
    input [1:0] B,
    output [3:0] C);

    wire w1,w2,w3,w4;

    and(C[0],A[0],B[0]);
    and(w1,A[0],B[1]);
    and(w2,A[1],B[0]);
    and(w3,A[1],B[1]);

    half_adder ha1(w1,w2,C[1],w4);
    half_adder ha2(w3,w4,C[2],C[3]);
endmodule;