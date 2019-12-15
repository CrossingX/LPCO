`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2019 03:11:14 PM
// Design Name: 
// Module Name: dram
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


module dram (input clk,
input we,
input re,
             input reset,
             input [1:0] flag,//00-> byte 01->half word  1x->word
		     input [7:0] a, 
		     input [31:0] wd,
			 output [31:0] rd);
			 	 
reg [7:0] RAM[255:0]; 

//read
assign rd=flag[1]? { {RAM[a+3]},{RAM[a+2]},{RAM[a+1]},{RAM[a+0]}} : ( flag[0]?{ {16{RAM[a+1][7]}} ,{RAM[a+1]},{RAM[a]} }:{ {24{RAM[a][7]}} ,RAM[a]} );
//assign rd[7:0] = (re)?RAM[a+3]:8'bz;
//assign rd[15:8] = (re)?RAM[a+2]:8'bz;
//assign rd[23:16] = (re)?RAM[a+1]:8'bz;
//assign rd[31:24] = (re)?RAM[a]:8'bz;
//write flag作为字节或字半字操作的标志
integer i;
always @ (posedge clk,posedge reset)
begin
    if(reset)begin
        for(i = 0; i < 256; i = i + 1) 
            RAM[i]=0;       
    end	
    else if (we) begin
        if(flag==2'b00)
        begin
            RAM[a]=wd[7:0];
        end
        else if(flag==2'b01 )
        begin
            { {RAM[a+1]},{RAM[a]} }=wd[15:0];
        end
        else if(flag==2'b11 )
        begin
            { {RAM[a+3]},{RAM[a+2]},{RAM[a+1]},{RAM[a+0]}}=wd;
        end           
    end  
end
endmodule