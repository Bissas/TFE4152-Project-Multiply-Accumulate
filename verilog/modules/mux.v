module mux (A,B,S,Y);
    input A, B, S;
    output Y;
    wire Sbar;

    cmos(Y, A, S, ~S);
    cmos(Y, B, ~S, S);
endmodule;