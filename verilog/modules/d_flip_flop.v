`include "../modules/d_latch.v"

module d_flip_flop(
    input in,
    input clk,
    input clk_bar,
    output Q,
    output Q_bar);

    wire w1, w2, w3, w4;

    not(w1,in);
    d_latch d1(w1,clk_bar,clk,,w2);
    d_latch d2(w2,clk,clk_bar,w4,w3);
    not(Q,w3);
    buf(Q_bar,w4);
endmodule;

