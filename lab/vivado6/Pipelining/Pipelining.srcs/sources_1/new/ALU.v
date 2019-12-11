`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2019 03:23:17 PM
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
input [2:0] ALU_operation, 
output reg[31:0] res, 
output reg zero,
output overflow
); 
always @(A or B or ALU_operation) // �������������仯ʱ����
begin 
case(ALU_operation) 
4'b0110: // ��
begin 
res = A - B; 
if(res == 0) 
zero = 1; 
else 
zero = 0; 
end 
4'b0010: // ��
begin
 res = A + B; 
end
4'b0000: // ��
res = A & B; 
4'b0001: // ��
res = A | B; 
4'b0101: // ���
res = ~(A | B); 
4'b0100: // ���
res = A ^ B; 
4'b1000: // ����
res = A<<B; 
4'b1001: // ����
res = A>>B; 
4'b1010: // ����
res = $signed(A)>>>B; 
4'b1101://sltu
begin 
if(A<B) 
res = 1; 
else res = 0;
end 
4'b0111: // С������
begin 
if((A < B && ~(A[31]^B[31])) || (A[31] & ~B[31])) 
res = 1; 
else res = 0;
end 
default: 
res = 0; 
endcase 
end 
endmodule

