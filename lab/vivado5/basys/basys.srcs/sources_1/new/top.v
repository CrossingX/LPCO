`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2019 03:16:07 PM
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
input clkin, 
input reset,
input sel,
output [6:0] seg,	
output [3:0] sm_wei	
); 

// ָ��Ĵ���pc 
reg [31:0] add4,pc; 
wire [31:0] inst;
wire [2:0] aluop;
wire [3:0] aluCtr;
wire [31:0] aluRes;
wire choose4; 
// �������ź���
wire[31:0] expand2, mux2, mux3, mux4, mux5, address, jmpaddr, mux6, mux8; 
wire[4:0] mux1,mux7; 
// CPU�����ź���
wire reg_dst, jmp, branch, memread, memwrite, memtoreg, jal, jr, lui, bne, bltz, bgtz, imm_expand,Write_hi, Write_lo;
wire Write_hi, Write_lo;
wire alu_srcA, regwrite; 
wire [1:0] flag, alu_srcB;
// ALU�ź���
wire zero; 

// ALU�����ź���

// �ڴ��ź���
wire[31:0] memreaddata; 
// �Ĵ����ź���
wire[31:0] RsData, RtData; 
// ��չ�ź���
wire[31:0] expand; 

integer clk_cnt;
reg clk;				//1.33��һ��ʱ�����ڣ��Դ�Ϊcpu��ʱ������	10^8/0.75*10^8=4/3=1.33 
always @(posedge clkin)
if(clk_cnt==32'd75_000_000) 
begin
clk_cnt <= 1'b0; 
clk <= ~clk;
end 
else
clk_cnt <= clk_cnt + 1'b1;

always @(negedge clk) // ʱ���½��ز���
begin 
    if(!reset) 
        begin
            pc = mux5; // ������һ��pc���޸�pc 
            #10
            add4 = pc + 32'b100; 
        end 
    else 
        begin
            pc = 32'b0; // ��λʱpcд0 
            #10
            add4 = 32'h4; 
        end 
end 


//always @(posedge clkin)//,posedge reset
//    begin 
//        if(reset)  pc = 32'b0;
//        else  pc = add4;
//    end 
    //assign add4=pc+4;

// ʵ����������ģ��
ctr mainctr( 
.opCode(inst[31:26]), 
.funct(inst[5:0]),
.regDst(reg_dst), 
.aluSrcA(alu_srcA), 
.aluSrcB(alu_srcB),
.memToReg(memtoreg), 
.regWrite(regwrite), 
.memRead(memread), 
.memWrite(memwrite), 
.branch(branch), 
.aluop(aluop), 
.jmp(jmp),
.jal(jal),
.jr(jr),
.lui(lui),
.bne(bne),
.bltz(bltz),
.bgtz(bgtz),
.imm_expand(imm_expand),
.flag(flag),
.Write_hi(Write_hi),
.Write_lo(Write_lo)
); 
// ʵ����ALUģ��
alu alu(.input1(mux6), 
.input2(mux2), 
.aluCtr(aluCtr), 
.zero(zero), 
.aluRes(aluRes));
// ʵ����ALU����ģ��
aluctr aluctr1( 
.ALUOp(aluop), 
.funct(inst[5:0]), 
.ALUCtr(aluCtr)); 
// ʵ����ramģ��
dram dmem( 
    .clk(!clk),
    .we(memwrite),
    .reset(reset),
    .flag(flag),
    .a(aluRes[7:0]), 
    .wd(RtData), 
    .rd(memreaddata) 
    );  
// ʵ����romģ��
irom imem (
  .clka(clk),    // input wire clka
  .addra(pc[9:2]),  // input wire [7 : 0] addra
  .douta(inst)  // output wire [31 : 0] douta
);
// ʵ�����Ĵ���ģ��
regFile regfile( 
.RsAddr(inst[25:21]), 
.RtAddr(inst[20:16]), 
.clk(!clk), 
.reset(reset), 
.regWriteAddr(mux7), 
.regWriteData(mux8), 
.regWriteEn(regwrite), 
.RsData(RsData), 
.RtData(RtData) 
); 
mux mux(
.q(RtData),
.w(expand),
.e({27'b000000000000000000000000000,inst[10:6]}),
.r(RsData),
.a(alu_srcB),
.c(mux2)
);
choose choose(
.branch(branch),
.bne(bne),
.bltz(bltz),
.bgtz(bgtz),
.zero(zero),
.a(RsData),
.choose4(choose4)
);
// ʵ����������չģ��
signext signext(.inst(inst[15:0]),.imm_expand(imm_expand), .data(expand)); 
smg_ip_model smg_ip_model(.clk(clkin),.data(aluRes),.sel(sel),.sm_wei(sm_wei),.sm_duan(seg));
// ���������ź��ߣ���ַ��������չ
assign mux1 = reg_dst ? inst[15:11] : inst[20:16]; 
//assign mux2 = (alu_srcB0 == 1'b0 && alu_srcB1 == 1'b0)? RtData : (alu_srcB0 == 1'b1 && alu_srcB1 == 1'b0) ? expand : (alu_srcB0 == 1'b1 && alu_srcB1 == 1'b0)?inst[10:6]:RsData;
assign mux3 = memtoreg ? memreaddata : aluRes; 
assign mux4 = choose4 ? address : add4; 
assign mux5 = jmp ? jmpaddr : (jr ? RsData:mux4);
assign mux6 = alu_srcA ? RtData:RsData;
assign mux7 = mux1 | {5{jal}};// jal=1,5{jal}=31, jal=0,5{jal}=0,
assign mux8 = (jal==1'b1)? add4: mux3;
//assign choose4 = branch & zero;

assign expand2 = expand << 2; 
assign jmpaddr = {add4[31:28], inst[25:0], 2'b00}; 
assign address = pc + expand2 + 4; 
endmodule
