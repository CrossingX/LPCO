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
output reg zero
); 
always @(A or B or ALU_operation) // 运算数或控制码变化时操作
begin 
case(ALU_operation) 
3'b110: // 减
begin 
res = A - B; 
if(res == 0) 
zero = 1; 
else 
zero = 0; 
end 
3'b010: // 加
begin
 res = A + B; 
end
3'b000: // 与
res = A & B; 
3'b001: // 或
res = A | B; 
3'b100: // 或非
res = ~(A | B); 
3'b011: // 异或
res = A ^ B; 
default: 
res = 0; 
endcase 
end 
endmodule

