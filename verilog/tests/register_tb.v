`include "../modules/register.v"

module register_tb;
    reg A;
    wire Q;
    wire Q_bar;

    reg EN = 0;
    reg RST = 0;
    wire RST_bar;
    assign RST_bar = ~RST;

    reg clk = 0;
    wire clk_bar;
    assign clk_bar = ~clk;
    always #1 clk = ~clk;

    register r1(A,EN,RST_bar,clk,clk_bar,Q,Q_bar);

    initial begin
        $dumpfile("../simulations/register_sim.vcd");
        $dumpvars(0, register_tb);

        #10; A = 1;
        #10; A = 0;
        #10; A = 1;
        #10; EN = 1;
        #10; A = 0;
        #10; A = 1;
        #10; A = 0;
        #10; A = 1;
        #10; EN = 0;
        #10; A = 0;
        #10; A = 1;
        #10; A = 0;
        #10; EN = 1;
        #10; A = 1;
        #10; A = 0;
        #10; A = 1;
        #10; EN = 0;
        #10; A = 0;
        #10; A = 1;
        #10; RST = 1;
        #10; EN = 1;
        #10; A = 0;
        #10; RST = 0;
        #10; A = 1;
        $finish();
    end;

endmodule;