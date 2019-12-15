`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2019 02:37:28 PM
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
input reset,
input [31:0] regWriteData, //д�Ĵ�����ֵ
input [4:0] regWriteAddr, //д�Ĵ���ʱ�Ĵ����ĵ�ַ����д�ĸ��Ĵ����� 
input regWriteEn,	//д�Ĵ���ʹ��
input [4:0] RsAddr,	//�ĸ��Ĵ�����Ϊ RS �Ĵ��� 
input [4:0] RtAddr,		//�ĸ��Ĵ�����Ϊ RT �Ĵ��� 
output [31:0] RsData,			//RS �μĴ�����ֵ
output [31:0] RtData //RT �Ĵ�����ֵ
);
//�Ĵ�����ַ���� 5 λ������������Ϊ�Ĵ���ֻ�� 32 ����5 λ���ܱ�ʾ���мĴ���
reg[31:0]regs[0:31]; // �Ĵ�����
//  ���ݵ�ַ���� Rs��Rt �Ĵ�������
assign RsData = (RsAddr == 5'b0 ) ? 32'b0 : regs[RsAddr]; 
assign RtData = (RtAddr == 5'b0 ) ? 32'b0 : regs[RtAddr]; 
integer i;
always @( posedge clk ) // ʱ�������ز���
begin
    if(!reset) 
    begin
        if(regWriteEn == 1) 
        begin
        regs[regWriteAddr] = regWriteData;//  дʹ���ź�Ϊ 1 ʱд���� // д������
        end
    end 
    else 
    begin
    for(i = 0; i < 32; i = i + 1)   regs[i] = 0;             //  ����ʱ���мĴ�����ֵΪ 0����λ
    end
end
endmodule

