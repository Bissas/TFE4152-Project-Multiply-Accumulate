`include "../modules/d_latch.v"

module d_latch_tb;

    reg a = 0;
    reg clk = 0;
    wire q;
    wire q_bar;

    d_latch d(a,clk,~clk,q,q_bar);

    initial begin;
        $dumpfile("../simulations/d_latch_sim.vcd");
        $dumpvars(1,d_latch_tb);

        wait(~clk) begin
            a = 1;
        end;
        wait(clk) begin
            #1;
            #1;
            #1;
            a = 0;
            #1;
            a = 1;
            #1; 
            a = 0;
            #1;
            a = 1;
        end;
        wait(~clk) begin
            #1;
            a = 0;
            #1;
            a = 1;
            #1; 
            a = 0;
            #1;
            #10;
        end;
        $finish;
    end;
    always #10 clk = ~clk;
endmodule;