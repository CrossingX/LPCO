`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 02:36:23 PM
// Design Name: 
// Module Name: regFile
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


module regFile( input clk,
input [3:0] Addr,		//�Ĵ�����ַ���� 
output reg [31:0] instruction// �Ĵ�����ֵ
);
//�Ĵ�����ַ���� 4 λ������������Ϊ�Ĵ���ֻ�� 16 ����4 λ���ܱ�ʾ���мĴ���
reg [31:0] regs [0:15]; // �Ĵ�����
integer i=0;
always @( posedge clk ) // ʱ�������ز���
begin
    
    instruction = regs[i] ; //  ȡָ��
    i=i+1;
    end
initial 
		begin
			regs[3]  = 32'b00000000001000100001100000101011;// sltu
			regs[2]  = 32'b00000000001000100001100000101010;// slt
			regs[1]  = 32'b00000000001000100001100000100001;// addu
			regs[0]  = 32'b00000000001000100001100000100000;// add
			regs[4]  = 32'b00000000001000000000000000001000;// jr
			regs[5]  = 32'b00100000001000100001100000101010;// addi
			regs[6]  = 32'b00000000001000100001100000000000;// sll
			regs[7]  = 32'b00111100000000100001100000101010;// lui
			regs[8]  = 32'b10001100001000100001100000101010;// lw  
			regs[9]  = 32'b10101100001000100001100000101010;// sw
			regs[10]  = 32'b00010000001000100001100000101010;//beq
			regs[11]  = 32'b00010100001000100001100000101010;//bne
            regs[12]  = 32'b00101000001000100001100000101010;// slti
			regs[13]  = 32'b00101100001000100001100000101010;// addi
			regs[14]  = 32'b00001000001000100001100000101010;//j
			regs[15]  = 32'b00001100001000100001100000101010;//jal
end
endmodule