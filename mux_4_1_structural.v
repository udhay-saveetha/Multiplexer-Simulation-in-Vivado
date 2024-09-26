module mux2_to_1 (a,b,s,out);
input s,b,a;
output out;
    assign out = s ? b : a;
endmodule
module mux4_to_1_structural (a,s,out);
input [3:0]a;
input [1:0]s;
output out;
    wire mux_low, mux_high;
    mux2_to_1 mux0 (.a(a[0]), .b(a[1]), .s(s[0]), .out(mux_low));
    mux2_to_1 mux1 (.a(a[2]), .b(a[3]), .s(s[0]), .out(mux_high));
    mux2_to_1 mux_final (.a(mux_low), .b(mux_high), .s(s[1]), .out(out));
endmodule
