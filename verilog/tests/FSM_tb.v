`include "../modules/FSM.v"

module FSM_tb;
    reg EN = 0;
    reg clk = 0;
    reg RST = 0;

    wire EN_out;
    always #1 clk = ~clk;

    FSM f1(EN,clk,RST,EN_out,,,);

    initial begin
        $dumpfile("../simulations/FSM_sim.vcd");
        $dumpvars(1, FSM_tb);
        RST=1;
        #1;
        RST=0;
        #20;
        EN = 1;
        #20;
        wait(~EN_out);
        wait(~clk);
        wait(clk); //1
        wait(~clk);
        wait(clk); //2
        EN = 0;
        #20;
        EN = 1;
        wait(~clk);
        wait(clk); //3
        wait(~clk);
        wait(clk); // pause
        #10;
        wait(~EN_out);
        wait(~clk);
        wait(clk); //1
        wait(~clk);
        wait(clk); //2
        RST = 1;
        #10;
        RST = 0;
        #20;
        //Starts from 1
        $finish();
    end;
endmodule;