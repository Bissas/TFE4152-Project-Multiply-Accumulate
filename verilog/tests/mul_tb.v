`include "../modules/mul.v"

module mul_tb;
    reg [1:0] a=0;
    reg [1:0] b=0;
    wire [3:0] c;

    integer i;
    integer j;

    integer p;

    mul m(a,b,c);

    initial begin
        $dumpfile("../simulations/mul_sim.vcd");
        $dumpvars(1,mul_tb);

        for(i=0;i<4;i=i+1) begin;
            a = i; #1;
            for (j = 0;j<4;j=j+1) begin;
                b = j;
                p = a*b;
                #1;
                if (p!=c) begin
                    $display("%d * %d != %d",a,b,c);
                end
            end
        end
    end
endmodule;