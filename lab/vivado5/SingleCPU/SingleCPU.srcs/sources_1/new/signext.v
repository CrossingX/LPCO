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
input [15:0] inst, // ����16λ
input imm_expand,
output [31:0] data // ���32λ
); 
// ���ݷ��Ų������λ
// �������λΪ1���򲹳�16��1����16'h ffff 
// �������λΪ0���򲹳�16��0 
assign data = (imm_expand == 1'b1)?{16'h0000,inst}:(inst[15:15]?{16'hffff,inst}:{16'h0000,inst});
endmodule
