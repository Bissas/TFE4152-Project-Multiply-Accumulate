`include "../modules/half_adder.v"

module half_adder_tb;
    wire sum;
    wire carry;
    reg a;
    reg b;

    half_adder ha1(a,b,sum,carry);

    initial begin
        $dumpfile("../simulations/half_adder_sim.vcd");
        $dumpvars;

        a = 0; b = 0;
        #1 a = 0; b = 1;
        #1 a = 1; b = 0;
        #1 a = 1; b = 1;
        #1;
    end;

endmodule;