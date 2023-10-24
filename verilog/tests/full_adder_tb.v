`include "../modules/full_adder.v"

module full_adder_tb;
    reg a,b,cin;
    wire s,cout;

    full_adder fa1(a,b,cin,s,cout);

    initial begin
        $dumpfile("../simulations/full_adder_sim.vcd");
        $dumpvars;

        a = 0; b = 0; cin = 0; #1;
        a = 0; b = 0; cin = 1; #1;
        a = 0; b = 1; cin = 0; #1;
        a = 0; b = 1; cin = 1; #1;
        a = 1; b = 0; cin = 0; #1;
        a = 1; b = 0; cin = 1; #1;
        a = 1; b = 1; cin = 0; #1;
        a = 1; b = 1; cin = 1; #1;
    end;
endmodule;