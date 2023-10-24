`include "../modules/mux.v"
`include "../modules/d_flip_flop.v"

module register(
    input in,
    input EN,
    input RST_bar,
    input CLK,
    input CLK_bar,
    output Q,
    output Q_bar);

    wire w1,w2;

    mux m1(in,Q,EN,w1);
    and(w2,w1,RST_bar);
    d_flip_flop d1(w2,CLK,CLK_bar,Q,Q_bar);
endmodule;

