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
    input [15:0] addr,
    output reg [15:0] instr
);
    reg [15:0] mem [0:255]; // 256 x 16-bit

    initial begin
        $readmemb("program.mem", mem); // Load program from file
    end

    always @(*) begin
        instr = mem[addr >> 1]; // word aligned
    end
endmodule
