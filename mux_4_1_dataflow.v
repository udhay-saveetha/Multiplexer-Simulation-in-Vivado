module mux_4_1_dataflow (a,s,out);
input [3:0]a;
input [1:0]s;
output out;
assign out=s[1]==0?(s[0]==0?a[0]:a[1]):(s[0]==0?a[2]:a[3]);
endmodule