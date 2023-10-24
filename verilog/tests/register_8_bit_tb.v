`include "../modules/register_8_bit.v"

module register_8_bit_tb;
    reg [7:0] A;
    wire [7:0] Q;
    wire [7:0] Q_bar;

    reg EN = 0;

    reg RST = 0;
    wire RST_bar;
    assign RST_bar = ~RST;

    reg clk = 0;
    wire clk_bar;
    assign clk_bar = ~clk;
    always #1 clk = ~clk;

    register_8_bit r1(A,EN,RST_bar,clk,clk_bar,Q,Q_bar);

    integer i = 0;

    initial begin
        $dumpfile("../simulations/register_8_bit_sim.vcd");
        $dumpvars(1, register_8_bit_tb);
        wait(clk);
        wait(~clk);
        EN = 1;
        RST = 0;
        for(i=0;i<256;i=i+1) begin
            wait(clk);
            A = i;
            wait(~clk);
            wait(clk);
            wait(~clk);
            wait(clk);
            if(A!=Q) begin
                $display("%d != %d",A,Q);
            end;
            wait(~clk);
            wait(clk);
            wait(~clk);
        end;
        wait(clk);
        wait(~clk);
        RST = 0;
        A = 100;
        wait(~clk);
        wait(clk);
        wait(~clk);
        EN = 0;
        for(i=0;i<256;i=i+1) begin
            wait(clk);
            A = i;
            wait(~clk);
            wait(clk);
            wait(~clk);
            wait(clk);
            if(Q!=100) begin
                $display("ERROR: Write with EN = 0, Q = %d", Q);
            end;
            wait(~clk);
            wait(clk);
            wait(~clk);
        end;
        wait(clk);
        wait(~clk);
        EN = 0;
        RST = 1;
        for(i=0;i<256;i=i+1) begin
            wait(clk);
            A = i;
            wait(~clk);
            wait(clk);
            wait(~clk);
            wait(clk);
            if(Q!=0) begin
                $display("ERROR: Write with RST = 1, Q = %d", Q);
            end;
            wait(~clk);
            wait(clk);
            wait(~clk);
        end;
        wait(clk);
        wait(~clk);
        EN = 1;
        RST = 1;
        for(i=0;i<256;i=i+1) begin
            wait(clk);
            A = i;
            wait(~clk);
            wait(clk);
            wait(~clk);
            wait(clk);
            if(Q!=0) begin
                $display("ERROR: Write with RST = 1, Q = %d", Q);
            end;
            wait(~clk);
            wait(clk);
            wait(~clk);
        end;
        $finish();
    end;
endmodule;