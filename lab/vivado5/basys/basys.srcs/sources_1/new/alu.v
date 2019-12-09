`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2019 03:08:16 PM
// Design Name: 
// Module Name: alu
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

module alu( 
input [31:0] input1, 
input [31:0] input2, 
input [3:0] aluCtr, 
output reg[31:0] aluRes, 
output reg zero 
); 
always @(input1 or input2 or aluCtr) // 运算数或控制码变化时操作
begin 
case(aluCtr) 
4'b0110: // 减
begin 
aluRes = input1 - input2; 
if(aluRes == 0) 
zero = 1; 
else 
zero = 0; 
end 
4'b0010: // 加
aluRes = input1 + input2; 
4'b0000: // 与
aluRes = input1 & input2; 
4'b0001: // 或
aluRes = input1 | input2; 
4'b0101: // 或非
aluRes = ~(input1 | input2); 
4'b0100: // 异或
aluRes = input1 ^ input2; 
4'b1000: // 左移
aluRes = input1<<input2; 
4'b1001: // 右移
aluRes = input1>>input2; 
4'b1010: // 右移
aluRes = $signed(input1)>>>input2; 
4'b1101://sltu
begin 
if(input1<input2) 
aluRes = 1; 
else aluRes = 0;
end 
4'b0111: // 小于设置
begin 
if((input1 < input2 && ~(input1[31]^input2[31])) || (input1[31] & ~input2[31])) 
aluRes = 1; 
else aluRes = 0;
end 
default: 
aluRes = 0; 
endcase 
end 
endmodule
