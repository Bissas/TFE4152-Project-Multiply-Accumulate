`include "../modules/mul.v"
`include "../modules/adder_8_bit.v"
`include "../modules/register_8_bit.v"

`ifndef mac
`define mac

module mac(
    input [1:0] A,
    input [1:0] B,
    input EN,
    input RST_bar,
    input CLK,
    input CLK_bar,
    output [7:0] Q);

    wire [3:0] M;
    wire [3:0] padding = 0;
    wire [7:0] S;

    mul m1(A,B,M);
    adder_8_bit a1({padding,M},Q,S,);
    register_8_bit r1(S,EN,RST_bar,CLK,CLK_bar,Q,);
endmodule;

`endif