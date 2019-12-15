`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2019 11:34:17 PM
// Design Name: 
// Module Name: mux2
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


module mux(
    input [31:0] q,
    input [31:0] w,
    input [31:0] e,
    inout [31:0] r,
    input [1:0] a,
    output [31:0]c
    );
assign c = (a == 2'b00)?q:
           (a == 2'b01)?w:
           (a == 2'b10)?e:r;
endmodule
