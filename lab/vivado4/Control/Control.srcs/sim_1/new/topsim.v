`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 03:27:02 PM
// Design Name: 
// Module Name: topsim
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

module topsim; 
// Inputs 
reg clkin; 
reg reset; 
//Outputs
// 指令寄存器Addr 
wire[31:0] instruction; 
// CPU 控制信号线
wire reg_dst, jmp, branch, memread, memwrite, memtoreg; wire[3:0] aluop; wire ExtOp;
wire regwrite;
wire alu_src;
// ALU 控制信号线
wire[3:0] aluCtr;
// Instantiate the Unit Under Test (UUT) 
top uut ( 
.clkin(clkin), 
.reset(reset),
.instruction(instruction),
.reg_dst(reg_dst),
.jmp(jmp),
.branch(branch),
.memread(memread),
.memwrite(memwrite),
.memtoreg(memtoreg),
.aluop(aluop),
.ExtOp(ExtOp),
.regwrite(regwrite),
.alu_src(alu_src),
.aluCtr(aluCtr)
); 
initial begin 
// Initialize Inputs 
clkin = 0; 
reset = 1; 
// Wait 100 ns for global reset to finish 
#100; 
reset = 0; 
end 
parameter PERIOD = 20; 
always begin 
clkin = 1'b0; 
#(PERIOD / 2) clkin = 1'b1; 
#(PERIOD / 2) ; 
end 
endmodule
