`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2019 11:20:34 PM
// Design Name: 
// Module Name: choose4
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


module choose(
input branch,
input bne,
input bltz,
input bgtz,
input zero,
input [31:0] a,
output choose4
    );
    assign choose4 = ((branch & zero & ~bne)||(branch & ~zero & bne)||(bltz & a[31])||(bgtz & (a[31] == 1'b0)))?(1'b1):(1'b0);
endmodule
