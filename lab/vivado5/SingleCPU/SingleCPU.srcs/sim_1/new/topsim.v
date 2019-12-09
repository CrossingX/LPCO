`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2019 04:25:51 PM
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
wire [31:0] pc;
wire [31:0] inst;
wire [2:0] aluop;
wire [31:0] aluRes;
wire [3:0] aluCtr;



//reg [31:0] add4; 
//wire choose4; 
// 复用器信号线
wire[31:0] expand2, mux2, mux3, mux4, mux5, address, jmpaddr, mux6, mux8; 
wire[4:0] mux1,mux7; 
// CPU控制信号线
wire reg_dst, jmp, branch, memread, memwrite, memtoreg, jal, jr, lui, bne, bltz, bgtz, imm_expand;
//wire Write_hi, Write_lo;
wire alu_srcA, regwrite; 
wire [1:0] flag, alu_srcB;
// ALU信号线
wire zero; 

// ALU控制信号线

// 内存信号线
wire[31:0] memreaddata; 
// 寄存器信号线
wire[31:0] RsData, RtData; 
// 扩展信号线
wire[31:0] expand; 



// Instantiate the Unit Under Test (UUT) 
top uut ( 
.clkin(clkin), 
.reset(reset), 
.pc(pc),
.inst(inst),
.aluop(aluop),
.aluRes(aluRes),
.aluCtr(aluCtr),
.reg_dst(reg_dst),
.jmp(jmp),
.branch(branch),
.memread(memread),
.memwrite(memwrite),
.memtoreg(memtoreg),
.jal(jal),
.jr(jr),
.lui(lui),
.bne(bne),
.bltz(bltz),
.bgtz(bgtz),
.imm_expand(imm_expand),
.alu_srcA(alu_srcA),
.regwrite(regwrite),
.flag(flag),
.alu_srcB(alu_srcB),
.zero(zero),
.memreaddata(memreaddata),
.RsData(RsData),
.RtData(RtData),
.expand(expand),
.expand2(expand2),
.address(address),
.jmpaddr(jmpaddr),
.mux1(mux1),
.mux2(mux2),
.mux3(mux3),
.mux4(mux4),
.mux5(mux5),
.mux6(mux6),
.mux7(mux7),
.mux8(mux8)
); 
initial begin 
// Initialize Inputs 
clkin = 0; 
reset = 1; 
// Wait 100 ns for global reset to finish 
#10; 
reset = 0; 
end 
parameter PERIOD = 20; 
always begin 
clkin = 1'b0; 
#(PERIOD / 2) clkin = 1'b1; 
#(PERIOD / 2) ; 
end 
endmodule
