`include "../modules/half_adder.v"

module full_adder (A, B, C_in, S, C_out);
    input A,B,C_in;
    output S,C_out;
    wire s1,c1,c2;

    half_adder ha1(A,B,s1,c1);
    half_adder ha2(C_in,s1,S,c2);
    or(C_out,c1,c2);
endmodule;