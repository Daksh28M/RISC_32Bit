`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 21:08:35
// Design Name: 
// Module Name: mux1, mux2, mux3, and_g, adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux1(
    input sel1,
    input [31:0] A1,
    input [31:0] B1,
    output [31:0] mux1_out
    );

assign mux1_out = (sel1==1'b0)? A1 : B1;

endmodule

module mux2(
    input sel2,
    input [31:0] A2,
    input [31:0] B2,
    output [31:0] mux2_out
    );

assign mux2_out = (sel2==1'b0)? A2 : B2;

endmodule

module mux3(
    input sel3,
    input [31:0] A3,
    input [31:0] B3,
    output [31:0] mux3_out
    );

assign mux3_out = (sel3==1'b0)? A3 : B3;

endmodule

module and_g(
    input branch,
    input zero,
    output and_out
    );

assign and_out = branch & zero;

endmodule

module adder(
    input [31:0] in1,
    input [31:0] in2,
    output [31:0] sum_out
    );

assign sum_out = in1+in2;

endmodule
