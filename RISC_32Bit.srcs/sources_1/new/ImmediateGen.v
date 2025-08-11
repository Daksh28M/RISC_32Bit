`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 19:50:28
// Design Name: 
// Module Name: ImmediateGen
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


module ImmediateGen(
    input [6:0] opcode,
    input [31:0] instruction,
    output reg [31:0] imm_ext
    );

always @(*)
begin
    case(opcode)
    7'b0000_011 : imm_ext <= {{20{instruction[31]}}, instruction[31:20]};   //makes 20 copies of MSB of instruction concatenated with 11 MSB instruction bits
    7'b0100_011 : imm_ext <= {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
    7'b1100_011 : imm_ext <= {{19{instruction[31]}},instruction[31],instruction[7],instruction[30:25],instruction[11:8],1'b0};
    endcase
end
endmodule
