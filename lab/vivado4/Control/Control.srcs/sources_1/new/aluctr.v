`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 02:43:23 PM
// Design Name: 
// Module Name: aluctr
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

module aluctr(
input [3:0] ALUOp, input [5:0] funct, output reg [3:0]  ALUCtr
);

always @(ALUOp or funct) //  如果操作码或者功能码变化执行操作
casex({ALUOp, funct}) // 拼接操作码和功能码便于下一步的判断
10'b0000xxxxxx: ALUCtr = 4'b0010; // lw，sw，addi 
10'b0001xxxxxx: ALUCtr = 4'b0110; // beq 
10'b1111xx0000: ALUCtr = 4'b0010; // add 
10'b1111xx0010: ALUCtr = 4'b0110; // sub 
10'b1111xx0100: ALUCtr = 4'b0000; // and 
10'b1111xx0101: ALUCtr = 4'b0001; // or 
10'b1111xx1010: ALUCtr = 4'b0111; // slt
endcase 
endmodule

