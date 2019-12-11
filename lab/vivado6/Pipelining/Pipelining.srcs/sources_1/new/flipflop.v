`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2019 03:05:31 PM
// Design Name: 
// Module Name: flipflop
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


module flipflop(clk,reset,in,out);
parameter WIDTH=1;//根据需要改宽度
input clk;//
input reset;
input [WIDTH-1:0] in;
output [WIDTH-1:0] out;//
reg[WIDTH-1:0] out;
always@(posedge clk)
if(reset)
out<={WIDTH{1'b0}};
else 
out<=in;
endmodule

