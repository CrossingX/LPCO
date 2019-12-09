`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 03:23:15 PM
// Design Name: 
// Module Name: aluctrsim
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


module aluctrsim; 
// Inputs 
reg [3:0] ALUOp; 
reg [5:0] funct; 
// Outputs 
wire [3:0] ALUctr; 
// Instantiate the Unit Under Test (UUT) 
aluctr uut ( 
.ALUOp(ALUOp), 
.funct(funct), 
.ALUCtr(ALUctr) 
); 
initial begin 
// Initialize Inputs 
ALUOp = 0; 
funct = 0; 
// Wait 100 ns for global reset to finish 
#100; 
// Add stimulus here 
ALUOp = 4'b0001; 
funct = 0; 
#100; 
ALUOp = 4'b1111; 
funct = 6'b100000; 
#100; 
ALUOp = 4'b1111; 
funct = 6'b101010; 
end 
endmodule

