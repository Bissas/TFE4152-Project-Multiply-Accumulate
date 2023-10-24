`ifndef half_adder
`define half_adder
module half_adder(A,B,S,C);
    input A,B;
    output S,C;

    // S = A xor B
    cmos(S, A, ~B, B);
    cmos(S, ~A, B, ~B);

    and(C, A, B);
endmodule;


`endif