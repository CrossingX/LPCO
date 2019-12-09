`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2019 03:02:00 PM
// Design Name: 
// Module Name: alu_sim
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


module alu_sim; 
// Inputs 
reg [15:0] input1; 
reg [15:0] input2; 
reg [3:0] aluCtr; 
// Outputs 
wire [15:0] aluRes; 
wire zero; 
// Instantiate the Unit Under Test (UUT) 
alu uut ( 
.input1(input1), 
.input2(input2), 
.aluCtr(aluCtr), 
.aluRes(aluRes), 
.zero(zero) 
); 
initial begin 
// Initialize Inputs 
input1 = 1; 
input2 = 1; 
aluCtr = 4'b0110; 
#100; 
input1 = 2; 
input2 = 1; 
aluCtr = 4'b0110; 
#100 
input1 = 1; 
input2 = 1; 
aluCtr = 4'b0010; 
#100 
input1 = 1; 
input2 = 0; 
aluCtr = 4'b0000; 
#100 
input1 = 1; 
input2 = 0; 
aluCtr = 4'b0001; 
#100 
input1 = 1; 
input2 = 0; 
aluCtr = 4'b0111; 
#100 
input1 = 0; 
input2 = 1; 
aluCtr = 4'b0111; 
end 
endmodule
