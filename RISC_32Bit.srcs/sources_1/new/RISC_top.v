`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 21:56:06
// Design Name: 
// Module Name: RISC_top
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

`include "ProgramCounter.v"
`include "PCplus4.v"
`include "InstructionMemory.v"
`include "Register_file.v"
`include "ImmediateGen.v"
`include "ControlUnit.v"
`include "ALU_control.v"
`include "ALU.v"
`include "data_memory.v"
`include "muxes.v"


module RISC_top(
    input clk,
    input reset
    );

    wire [31:0] pc_in_top, PC_top, instr_top;
    wire reg_write_top;
    wire [1:0] ALUOp_top;
    wire [31:0] read_data1_top, read_data2_top, write_data_top;
    wire [3:0] ALU_control_top;
    wire ALUSrc_top, MemRead_top, MemWrite_top, MemtoReg_top;
    wire [31:0] imm_ext_top;
    wire [31:0] ALU_inB_top;
    wire branch_top;
    wire zero_top;
    wire and_out_top;
    wire [31:0] NextToPC_top, sum_out_top, ALU_result_top, MemData_out_top;

    //Program Counter
    ProgramCounter PC(.clk(clk),.reset(reset),.pc_in(pc_in_top),.pc_out(PC_top));
    
    //PC Adder
    PCplus4 PC_adder(.fromPC(PC_top),.NextToPC(NextToPC_top));
    
    //Instruction Memory
    InstructionMemory Inst_mem(.clk(clk),.reset(reset),.read_addr(PC_top),.instr_out(instr_top));
    
    //Register file
    Register_file Reg_File(.clk(clk),.reset(reset),.reg_write(reg_write_top),
                            .Rs1(instr_top[19:15]),.Rs2(instr_top[24:20]),
                            .Rd(instr_top[11:7]),.write_data(write_data_top),
                            .read_data1(read_data1_top),.read_data2(read_data2_top));
    
    //Immediate Generator
    ImmediateGen Imm_Gen(.opcode(instr_top[6:0]),.instruction(instr_top),.imm_ext(imm_ext_top));
    
    //Control Unit
    ControlUnit CU(.instruction(instr_top[6:0]),.branch(branch_top),
                    .MemRead(MemRead_top),.MemtoReg(MemtoReg_top),
                    .MemWrite(MemWrite_top),.ALUSrc(ALUSrc_top),
                    .RegWrite(reg_write_top),.ALUOp(ALUOp_top));
    
    //ALU Control
    ALU_control ALU_CU(.ALUOp(ALUOp_top),.func7(instr_top[30]),
                        .func3(instr_top[14:12]),.Control_out(ALU_control_top));
    
    //ALU
    ALU ALU_unit(.A(read_data1_top),.B(ALU_inB_top),.control_in(ALU_control_top),
                .zero(zero_top),.ALU_result(ALU_result_top));

    //ALU mux
    mux1 ALU_mux(.sel1(ALUSrc_top),.A1(read_data2_top),.B1(imm_ext_top),.mux1_out(ALU_inB_top));

    //Adder
    adder adder(.in1(PC_top),.in2(imm_ext_top),.sum_out(sum_out_top));

    //AND Gate
    and_g and_gate(.branch(branch_top),.zero(zero_top),.and_out(and_out_top));

    //Adder mux
    mux2 adder_mux(.sel2(and_out_top),.A2(NextToPC_top),.B2(sum_out_top),.mux2_out(pc_in_top));

    //data memory
    data_memory data_mem(.clk(clk),.reset(reset),.MemWrite(MemWrite_top),
                        .MemRead(MemRead_top),.read_addr(ALU_result_top),
                        .Write_data(read_data2_top),.MemData_out(MemData_out_top));

    //data memory mux
    mux3 data_mem_mux(.sel3(MemtoReg_top),.A3(ALU_result_top),
                    .B3(MemData_out_top),.mux3_out(write_data_top));
endmodule
