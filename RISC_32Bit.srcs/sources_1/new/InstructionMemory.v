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
    output [31:0] instr_out
);
    reg [31:0] mem [63:0]; // 64 x 32-bit
    integer k;
    // initial begin
        // $readmemb("program.mem", mem); // Load program from file
    // end
    
    assign instr_out = mem[read_addr];

    always @(posedge clk or posedge reset) begin
        if(reset)
        begin
            for(k=0;k<64;k=k+1) mem[k]<=32'h0000_0000;
        end
        else

            //R-type
            mem[0] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;   //no operation
            mem[4] = 32'b0000000_11001_10000_000_01101_0110011;     //add x13, x16, x25
            mem[8] = 32'b0100000_00011_01000_000_00101_0110011;     //sub x5, x8, x3
            mem[12] = 32'b0000000_00011_00010_111_00001_0110011;    //and x1, x2, x3
            mem[16] = 32'b0000000_00011_00011_110_00100_0110011;    //or x4, x3, x5
            
            //I-type
            mem[20] = 32'b000000000011_10101_000_10110_0010011;     //aadi x22, x21, 3
            mem[24] = 32'b000000000001_01000_110_01001_0010011;     //ori x9, x8, 1 

            //L-type
            mem[28] = 32'b000000001111_00101_010_01000_0000011;     //lw x8, 15(x5)
            mem[32] = 32'b000000000011_00011_010_01001_0000011;     //lw x9, 3(x3)

            //S-type
            mem[36] = 32'b0000000_01111_00101_010_01100_0100011;    //sw x15, 12(x5)
            mem[40] = 32'b0000000_01110_00110_010_01010_0100011;    //sw x14, 10(x6)
            
            //SB-type
            mem[44] = 32'h00948663;     //beq x9, x9, 12
    end
endmodule
