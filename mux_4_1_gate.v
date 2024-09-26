module mux_4_1_gate(a,s,out);
input [3:0]a;
input [1:0]s;
output out;
wire [3:0]w;
and (w[0],a[0],~s[1],~s[0]);
and (w[1],a[1],~s[1],s[0]);
and (w[2],a[2],s[1],~s[0]);
and (w[3],a[3],s[1],s[0]);
or (out,w[0],w[1],w[2],w[3]);
endmodule