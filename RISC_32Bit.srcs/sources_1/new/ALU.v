`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 20:25:56
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] control_in,
    output reg zero,
    output reg [31:0] ALU_result
    );

always @(control_in or A or B)
begin  
    case(control_in)
    4'b0000: begin 
        zero <=0; 
        ALU_result <= A & B; 
        end
    4'b0001: begin 
        zero <=0; 
        ALU_result <= A | B; 
        end
    4'b0010: begin 
        zero <=0; 
        ALU_result <= A + B; 
        end
    4'b0110: begin 
        if(A==B) zero <=1;
        else zero <=0;
        ALU_result <= A - B; 
        end
    endcase
end
endmodule
