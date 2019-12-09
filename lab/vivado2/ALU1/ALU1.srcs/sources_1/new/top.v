`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2019 03:18:37 PM
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
input clk, 
input reset, //��λ�źţ�����һ��������
input [8:0] input3,
input[3:0] aluCtr,
output [6:0] seg,//����
output [3:0] sm_wei//�ĸ������
);
// ALU�ź���
wire[15:0] input1;
wire[15:0] input2;
assign input2[0] = input3[0];
assign input2[1] = input3[1];
assign input2[2] = input3[2];
assign input2[3] = input3[3];
assign input2[4] = input3[4];
assign input2[5] = input3[5];
assign input2[6] = input3[6];
assign input2[7] = input3[7];
assign input2[8] = input3[8];
assign input2[9] = input3[8];
assign input2[10] = input3[8];
assign input2[11] = input3[8];
assign input2[12] = input3[8];
assign input2[13] = input3[8];
assign input2[14] = input3[8];
assign input2[15] = input3[8];
assign input1 = 16'h7;
wire zero; 
wire[15:0] aluRes; 
//wire[15:0] expand;
// ALU�����ź��� 
// ʵ����ALUģ��

alu alu(.input1(input1), 
.input2(input2), 
.aluCtr(aluCtr), 
.zero(zero), 
.aluRes(aluRes)); 
// ����������������������������������������������������ʵ����������չģ��
//signext signext(.inst(inst[15:0]), .data(expand));

//...............................ʵ�����������ʾģ��
display disp1 (.clk(clk),.sm_wei(sm_wei),.data(aluRes[15:0]),.sm_duan(seg));
endmodule

