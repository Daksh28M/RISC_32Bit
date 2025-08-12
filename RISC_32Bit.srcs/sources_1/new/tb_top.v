`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 02:10:57
// Design Name: 
// Module Name: tb_top
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
`include "RISC_top.v"

module tb_top;

    reg clk, reset;
    
    RISC_top uut(.clk(clk),.reset(reset));
    
    initial begin
    clk=0;
    reset =1;
    #5;
    reset=0;    
    #400;
    end
    
    always #5 clk = ~clk;
endmodule
