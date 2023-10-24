`include "../modules/adder_8_bit.v"

module adder_8_bit_tb;
    reg [7:0] A = 0;
    reg [7:0] B = 0;
    wire [8:0] Sum;

    integer i;
    integer j;

    adder_8_bit adder(A,B,Sum[7:0],Sum[8]);

    initial begin;
        $dumpfile("../simulations/adder_8_bit_sim.vcd");
        $dumpvars(1, adder_8_bit_tb);

        for(i=0;i<256;i=i+1) begin;
            A = i; #1;
            for(j=0;j<256;j=j+1) begin;
                B = j; #1;
                if ((A+B)!=Sum) begin;
                    $monitor("%d + %d != %d", A, B, Sum);
                end;
            end;
        end;
    end;
endmodule;