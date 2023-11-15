`include "../modules/half_adder.v"
`include "../modules/full_adder.v"

`ifndef adder_8_4_bit
`define adder_8_4_bit

module adder_8_4_bit(
    input [7:0] A,
    input [3:0] B,
    output [7:0] S,
    output carry);

    wire [7:0] C;

    assign carry=C[7];

    half_adder add0(A[0],B[0],S[0],C[0]);
    full_adder add1(A[1],B[1],C[0],S[1],C[1]);
    full_adder add2(A[2],B[2],C[1],S[2],C[2]);
    full_adder add3(A[3],B[3],C[2],S[3],C[3]);
    half_adder add4(A[4],C[3],S[4],C[4]);
    half_adder add5(A[5],C[4],S[5],C[5]);
    half_adder add6(A[6],C[5],S[6],C[6]);
    half_adder add7(A[7],C[6],S[7],C[7]);

endmodule;

`endif