`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2019 03:12:43 PM
// Design Name: 
// Module Name: smg_ip_model
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

module smg_ip_model(clk,data,sel,sm_wei,sm_duan); input clk;
input [31:0] data;
input sel;
output [3:0] sm_wei;
output [7:0] sm_duan;
//---------------------------------------------------------//位控制
integer clk_cnt;            //初始为0
    reg clk_400Hz; 
    always @(posedge clk)
        if(clk_cnt==32'd100000) //每到十进制的100000
            begin 
                clk_cnt <= 1'b0;        //清零
                clk_400Hz <= ~clk_400Hz;//时钟信号取反
            end 
        else clk_cnt <= clk_cnt + 1'b1; //没到100000就加一
        
//---------------------------------------------------------//位控制
reg [3:0]wei_ctrl=4'b1110; //0的那个是亮的那个 
always @(posedge clk_400Hz)
wei_ctrl <= {wei_ctrl[2:0],wei_ctrl[3]}; //段控制 ,就是把最左边的一位弄到最右边
reg [3:0]duan_ctrl; 
always @(wei_ctrl) 
case(wei_ctrl)
4'b1110:duan_ctrl=sel?data[19:16]:data[3:0];
 4'b1101:duan_ctrl=sel?data[23:20]:data[7:4]; 
 4'b1011:duan_ctrl=sel?data[27:24]:data[11:8];
  4'b0111:duan_ctrl=sel?data[31:28]:data[15:12]; 
  default:duan_ctrl=4'hf;
endcase
//----------------------------------------------------------
//解码模块 
reg [7:0]duan;
always @(duan_ctrl)
case(duan_ctrl) //让数码管相应的显示单元亮 
4'h0:duan=8'b1100_0000;//0
4'h1:duan=8'b1111_1001;//1
4'h2:duan=8'b1010_0100;//2
4'h3:duan=8'b1011_0000;//3
4'h4:duan=8'b1001_1001;//4
4'h5:duan=8'b1001_0010;//5
4'h6:duan=8'b1000_0010;//6
4'h7:duan=8'b1111_1000;//7
4'h8:duan=8'b1000_0000;//8
4'h9:duan=8'b1001_0000;//9 
4'ha:duan=8'b1000_1000;//a 
4'hb:duan=8'b1000_0011;//b 
4'hc:duan=8'b1100_0110;//c 
4'hd:duan=8'b1010_0001;//d 
4'he:duan=8'b1000_0110;//e 
4'hf:duan=8'b1000_1110;//f
// 4'hf:duan=8'b1111_1111;//不显示
default : duan = 8'b1100_0000;//0 
endcase
//----------------------------------------------------------
assign sm_wei = wei_ctrl; 
assign sm_duan = duan;
endmodule
