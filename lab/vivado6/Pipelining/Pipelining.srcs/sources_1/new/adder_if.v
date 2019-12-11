`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2019 03:08:29 PM
// Design Name: 
// Module Name: adder_if
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


module adder_if(a,b, PCadd4);
input [31:0] a,b;//偏移量
output [31:0] PCadd4;//新指令地址
assign PCadd4=a+b;
endmodule

