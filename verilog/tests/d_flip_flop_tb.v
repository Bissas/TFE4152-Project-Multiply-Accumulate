`include "../modules/d_flip_flop.v"

module d_flip_flop_tb;
    reg A = 0;
    wire Q;
    wire Q_bar;

    reg clk = 0;
    wire clk_bar;
    assign clk_bar = ~clk;
    always #10 clk = ~clk;

    d_flip_flop d1(A,clk,clk_bar,Q,Q_bar);

    initial begin
        $dumpfile("../simulations/d_flip_flop_sim");
        $dumpvars;
        wait(clk);
        wait(~clk);
        #1;
        A = 1;
        #1;
        A = 0;
        #3;
        A = 1;
        wait(clk) begin
            #1;
            A = 0;
            #1;
            A = 1;
            #1;
            A = 0;
        end
        wait(~clk) begin
            #1;
            A = 1;
            #1;
            A = 0;
            #3;
            A = 1;
            #1;
            A = 0;
        end
        wait(clk) begin
            #1;
            A = 0;
            #1;
            A = 1;
            #1;
            A = 0;
            #3;
            A = 1;
        end
        #11;
        $finish;
    end
endmodule;