`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 17:33:02
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(
    input clk, reset,
    input [31:0] pc_in,
    output reg [31:0] pc_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 32'h0000_0000;
        else
            pc_out <= pc_in;
    end
endmodule

