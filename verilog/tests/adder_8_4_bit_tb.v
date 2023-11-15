`include "../modules/adder_8_4_bit.v"

`ifndef adder_8_4_bit_tb
`define adder_8_4_bit_tb

module adder_8_4_bit_tb;

    reg [7:0] A;
    reg [3:0] B;

    wire [8:0] S;

    integer a = 0;
    integer b = 0;

    adder_8_4_bit add0(A,B,S[7:0],S[8]);

    initial begin;
        $dumpfile("../simulations/adder_8_4_bit_sim.vcd");
        $dumpvars(1, adder_8_4_bit_tb);

        for (a = 0; a < 256; a = a + 1) begin
            A = a;
            for (b = 0; b < 16; b = b + 1) begin
            B = b;
            #1;
            if ((A+B)!=S) begin;
                    $monitor("%d + %d != %d", A, B, S);
                end;  
            end;
        end;
    end;

endmodule;

`endif