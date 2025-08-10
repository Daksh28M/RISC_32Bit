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


module Register_file(
    input clk,
    input reset,
    input reg_write,    //control signal for wirting to Rd address
    input [4:0] Rs1, Rs2, Rd,   //address of source and destination registers
    input [31:0] write_data,    //data to write at Rd
    output [31:0] read_data1, read_data2    //data read from Rs1,Rs2
);

reg [31:0] Registers [31:0];    //32 x 32bit registers 
integer k;

always @(posedge clk or posedge reset)
begin
    if(reset)
        for(k=0;k<32;k=k+1) Registers[k] <= 32'h0000_0000;

    else if(reg_write) Registers[Rd] <= write_data;
end
assign read_data1 = Registers[Rs1];
assign read_data2 = Registers[Rs2];

endmodule