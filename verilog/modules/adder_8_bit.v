`include "../modules/full_adder.v"

module adder_8_bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output c );

    wire [6:0] c_sub;

    half_adder ha1(a[0],b[0],s[0],c_sub[0]);
    full_adder fa1(a[1],b[1],c_sub[0],s[1],c_sub[1]);
    full_adder fa2(a[2],b[2],c_sub[1],s[2],c_sub[2]);
    full_adder fa3(a[3],b[3],c_sub[2],s[3],c_sub[3]);
    full_adder fa4(a[4],b[4],c_sub[3],s[4],c_sub[4]);
    full_adder fa5(a[5],b[5],c_sub[4],s[5],c_sub[5]);
    full_adder fa6(a[6],b[6],c_sub[5],s[6],c_sub[6]);
    full_adder fa7(a[7],b[7],c_sub[6],s[7],c);
endmodule;