`timescale 1ns / 1ps
module mux4_to_1_tb;
reg [3:0]a;
reg [1:0]s;
wire out;
    wire out_gate;
    wire out_dataflow;
    wire out_behavioral;
    wire out_structural;
    mux_4_1_gate uut_gate (
        .a(a),
        .s(s),
        .out(out_gate)
    );
    mux_4_1_dataflow uut_dataflow (
        .a(a),
        .s(s),
        .out(out_dataflow)
    );
    mux_4_1_behavioral uut_behavioral (
        .a(a),
        .s(s),
        .out(out_behavioral)
    );
    mux4_to_1_structural uut_structural (
        .a(a),
        .s(s),
        .out(out_structural)
    );
    initial begin
            a[0] = 0; a[1] = 0; a[2] = 0; a[3] = 0; s[0] = 0; s[1] = 0;
        #2 {s[1], s[0], a[3], a[2], a[1], a[0]} = 6'b00_0000; 
        #2 {s[1], s[0], a[3], a[2], a[1], a[0]} = 6'b00_0001; 
        #2 {s[1], s[0], a[3], a[2], a[1], a[0]} = 6'b01_0010; 
        #2 {s[1], s[0], a[3], a[2], a[1], a[0]} = 6'b10_0100; 
        #2 {s[1], s[0], a[3], a[2], a[1], a[0]} = 6'b11_1000; 
        #2 {s[1], s[0], a[3], a[2], a[1], a[0]} = 6'b01_1100; 
        #2 {s[1], s[0], a[3], a[2], a[1], a[0]} = 6'b10_1010; 
        #2 {s[1], s[0], a[3], a[2], a[1], a[0]} = 6'b11_0110; 
        #2 {s[1], s[0], a[3], a[2], a[1], a[0]} = 6'b00_1111; 
        #2 $stop;
    end
    initial begin
        $monitor("Time=%0t | s[1]=%b s[0]=%b | Inputs: a[0]=%b a[1]=%b a[2]=%b a[3]=%b | out_gate=%b | out_dataflow=%b | out_behavioral=%b | out_structural=%b",
        $time, s[1], s[0], a[0], a[1], a[2], a[3], out_gate, out_dataflow, out_behavioral, out_structural);
    end
endmodule