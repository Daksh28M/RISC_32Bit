`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 20:07:09
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [6:0] instruction,
    output reg branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg [1:0] ALUOp
    );

always @(*)
begin
    case(instruction)
        7'b0110_011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch, ALUOp} <= 8'b0010_0010;   //R-type
        7'b0000_011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch, ALUOp} <= 8'b1111_0000;   //I-type
        7'b0100_011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch, ALUOp} <= 8'b1000_1000;   //S-type
        7'b1100_011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch, ALUOp} <= 8'b0000_0101;   //seq
    endcase
end
endmodule
