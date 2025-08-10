`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 18:03:35
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input clk,
    input reset,
    input [31:0] read_addr,
    output reg [31:0] instr_out
);
    reg [32:0] mem [63:0]; // 64 x 32-bit
    integer k;
    initial begin
        $readmemb("program.mem", mem); // Load program from file
    end

    always @(posedge clk or posedge reset) begin
        if(reset)
        begin
            for(k=0;k<64;k=k+1) mem[k]<=32'h0000_0000;
        end
        else
            instr_out = mem[read_addr];
    end
endmodule
