`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 21:00:34
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input clk,
    input reset,
    input MemWrite,
    input MemRead,
    input [31:0] read_addr,
    input [31:0] Write_data,
    output [31:0] MemData_out
    );

reg [31:0] D_Memory[63:0];  //64 x 32 bit data memory
integer k;

always @(posedge clk or posedge reset)
begin
    if(reset) 
        for(k=0;k<64;k=k+1) 
            D_Memory[k] <=32'h0000_0000;
    
    else if(MemWrite) D_Memory[read_addr] <= Write_data;
end

assign MemData_out = (MemRead)?D_Memory[read_addr] : 32'h0000_0000;

endmodule
