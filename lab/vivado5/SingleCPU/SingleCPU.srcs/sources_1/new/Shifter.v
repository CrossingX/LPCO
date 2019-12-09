`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2019 03:09:24 PM
// Design Name: 
// Module Name: Shifter
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


module Shifter(
		input [31:0] SHIN,
		input [4:0]  AMT,//sa
		input        ShiDir,
		input        Arith,
		output reg [31:0] SHOUT
    );

	always @(*) begin
		if (!ShiDir)      SHOUT = SHIN << Sa ;
		else if (!Arith) SHOUT = SHIN >> Sa;//
		else       SHOUT = $signed(SHIN) >>> Sa;//À„ ˝”““∆
	end	

endmodule
