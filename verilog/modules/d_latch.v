module d_latch(
    input in,
    input clk,
    input clk_bar,
    output Q,
    output Q_bar);

    wire clk_bar,w;

    not(w,Q_bar);
    not(Q_bar,Q);
    cmos(Q,in,clk,clk_bar);
    cmos(Q,w,clk_bar,clk);
endmodule;