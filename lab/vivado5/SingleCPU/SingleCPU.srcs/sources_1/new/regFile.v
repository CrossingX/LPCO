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
input [31:0] regWriteData, //写寄存器的值
input [4:0] regWriteAddr, //写寄存器时寄存器的地址（即写哪个寄存器） 
input regWriteEn,	//写寄存器使能
input [4:0] RsAddr,	//哪个寄存器作为 RS 寄存器 
input [4:0] RtAddr,		//哪个寄存器作为 RT 寄存器 
output [31:0] RsData,			//RS 段寄存器的值
output [31:0] RtData //RT 寄存器的值
);
//寄存器地址都是 5 位二进制数，因为寄存器只有 32 个，5 位就能表示所有寄存器
reg[31:0]regs[0:31]; // 寄存器组
//  根据地址读出 Rs、Rt 寄存器数据
assign RsData = (RsAddr == 5'b0 ) ? 32'b0 : regs[RsAddr]; 
assign RtData = (RtAddr == 5'b0 ) ? 32'b0 : regs[RtAddr]; 
integer i;
always @( posedge clk ) // 时钟上升沿操作
begin
    if(!reset) 
    begin
        if(regWriteEn == 1) 
        begin
        regs[regWriteAddr] = regWriteData;//  写使能信号为 1 时写操作 // 写入数据
        end
    end 
    else 
    begin
    for(i = 0; i < 32; i = i + 1)   regs[i] = 0;             //  重置时所有寄存器赋值为 0，复位
    end
end
endmodule

