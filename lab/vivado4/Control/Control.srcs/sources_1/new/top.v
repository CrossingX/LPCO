`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 02:44:12 PM
// Design Name: 
// Module Name: top
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


module top(
input clkin, input reset,
output [31:0] instruction,
output reg_dst,
output jmp,
output branch,
output memread,
output memtoreg,
output [3:0] aluop,
output ExtOp,
output regwrite,
output memwrite,
output alu_src,
output [3:0] aluCtr
);
reg[3:0] Addr=0;
// 例化寄存器
regFile regFile ( .clk(clkin), 
.Addr(Addr),
.instruction(instruction) 
);

// 实例化控制器模块
ctr mainctr(
.opCode(instruction[31:26]),
.regDst(reg_dst),
.aluSrc(alu_src),
.memToReg(memtoreg),
.regWrite(regwrite),
.memRead(memread),
.memWrite(memwrite),
.branch(branch),
.aluop(aluop),
.ExtOp(ExtOp),
.jmp(jmp));
//  实例化 ALU 控制模块
aluctr aluctr1(
.ALUOp(aluop),
.funct(instruction[5:0]),
.ALUCtr(aluCtr));
endmodule

