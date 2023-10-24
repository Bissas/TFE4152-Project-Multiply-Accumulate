`include "../modules/register.v"
`include "../modules/full_adder.v"

module FSM(
    input EN_in,
    input CLK_in,
    input RST_in,
    output EN,
    output CLK,
    output CLK_bar,
    output RST_bar);

    wire [1:0] counter; //For the adder
    wire [1:0] state;
    wire run;

    assign CLK = CLK_in;
    assign CLK_bar = ~CLK_in;
    assign RST_bar = ~RST_in;
    register r1(counter[0],EN_in,RST_bar,CLK,CLK_bar,state[0],);
    register r2(counter[1],EN_in,RST_bar,CLK,CLK_bar,state[1],);
    not(counter[0],state[0]);
    xor(counter[1],state[1],state[0]);
    nand(run,state[0],state[1]);
    and(EN,EN_in,run);
endmodule;