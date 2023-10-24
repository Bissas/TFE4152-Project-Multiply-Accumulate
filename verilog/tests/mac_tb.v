`include "../modules/mac.v"

module mac_tb;
    reg [1:0] A = 0;
    reg [1:0] B = 0;
    
    wire [7:0] Q;

    reg EN = 0;

    reg RST = 0;
    wire RST_bar;
    assign RST_bar = ~RST;

    reg clk = 0;
    wire clk_bar;
    assign clk_bar = ~clk;
    always #1 clk = ~clk;

    mac M1(A,B,EN,RST_bar,clk,clk_bar,Q);

    initial begin
        $dumpfile("../simulations/mac_sim.vcd");
        $dumpvars(0,mac_tb);
        RST = 1;
        #1;
        RST = 0;
        A = 1;
        EN = 1;
        #10;
        EN = 0;
        B = 1;
        #10;
        EN = 1;
        #20;
        RST = 1;
        #10;
        A = 2;
        RST = 0;
        #10;
        A = 3;
        RST = 1;
        #3;
        RST = 0;
        #10
        $finish();
    end
endmodule;