`include "../modules/register.v"

module register_8_bit(
    input [7:0] In,
    input EN,
    input RST_bar,
    input CLK,
    input CLK_bar,
    output [7:0] Q,
    output [7:0] Q_bar);

    register r0(In[0],EN,RST_bar,CLK,CLK_bar,Q[0],Q_bar[0]);
    register r1(In[1],EN,RST_bar,CLK,CLK_bar,Q[1],Q_bar[1]);
    register r2(In[2],EN,RST_bar,CLK,CLK_bar,Q[2],Q_bar[2]);
    register r3(In[3],EN,RST_bar,CLK,CLK_bar,Q[3],Q_bar[3]);
    register r4(In[4],EN,RST_bar,CLK,CLK_bar,Q[4],Q_bar[4]);
    register r5(In[5],EN,RST_bar,CLK,CLK_bar,Q[5],Q_bar[5]);
    register r6(In[6],EN,RST_bar,CLK,CLK_bar,Q[6],Q_bar[6]);
    register r7(In[7],EN,RST_bar,CLK,CLK_bar,Q[7],Q_bar[7]);
endmodule;