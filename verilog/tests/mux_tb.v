`include "../modules/mux.v"
module mux_tb;
    reg a = 0;
    reg b = 0;
    reg s = 0;
    wire y;

    mux m1(a,b,s,y);

    initial begin
        $dumpfile("mux_sim.vcd");
        $dumpvars;

        a=0;b=0;s=0;
        #1 a=0;b=0;s=1;
        #1 a=0;b=1;s=0;
        #1 a=0;b=1;s=1;
        #1 a=1;b=0;s=0;
        #1 a=1;b=0;s=1;
        #1 a=1;b=1;s=0;
        #1 a=1;b=1;s=1;
        #1;
        
    end;

endmodule;