`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2019 02:54:13 PM
// Design Name: 
// Module Name: rom_top
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
module rom_top(Clk,Rst,seg,sm_wei);
  input Clk;//系统时钟
  input Rst;//高电平复位
 // output [15:0] data;//输出数据
  output [6:0] seg;//段码
  output [3:0] sm_wei;//哪个数码管
  
 wire [15:0] data;
  reg [7:0]addr;//rom地址
 
 integer clk_cnt;
reg clkin;//1.33秒一个时钟周期，以此为cpu的时钟周期	10^8/0.75*10^8=4/3=1.33 
always @(posedge Clk)
if(clk_cnt==32'd75_000_000) 
begin
clk_cnt <= 1'b0; 
clkin <= ~clkin;
end 
else
clk_cnt <= clk_cnt + 1'b1;
//分频
 integer clk_cnt1;
reg clkin1;
always @(posedge Clk)
if(clk_cnt1==32'd75_000) 
begin
clk_cnt1 <= 1'b0; 
clkin1 <= ~clkin1;
end 
else
clk_cnt1 <= clk_cnt1 + 1'b1;

always@(posedge clkin or negedge Rst)
       if(Rst)
              addr<=8'd0;
        else if(addr == 8'd255)
                addr<=8'd0;
        else 
               addr<=addr+1'b1; 
Ins_Rom your_instance_name (
                 .clka(Clk),    // input wire clka
                 .addra(addr),  // input wire [7 : 0] addra
                 .douta(data)  // output wire [15 : 0] douta
              );
 display dis
                  (.clk(clkin1),
                   .data (data),
                   .sm_duan(seg),
                   .sm_wei(sm_wei));  
endmodule
