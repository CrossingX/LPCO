`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2019 03:09:48 PM
// Design Name: 
// Module Name: signext
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


module signext( 
input [15:0] inst, // 输入16位
input imm_expand,
output [31:0] data // 输出32位
); 
// 根据符号补充符号位
// 如果符号位为1，则补充16个1，即16'h ffff 
// 如果符号位为0，则补充16个0 
assign data = (imm_expand == 1'b1)?{16'h0000,inst}:(inst[15:15]?{16'hffff,inst}:{16'h0000,inst});
endmodule
