`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2019 03:28:38 PM
// Design Name: 
// Module Name: DataRAM
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


module DataRAM (input clka,
input wea,
		     input [9:0] addra, 
		     input [31:0] dina,
			 output [31:0] douta);
reg [7:0] RAM[1023:0]; 
//read
initial begin
RAM[0] = 8'h00;
RAM[1] = 8'h00;
RAM[2] = 8'h00;
RAM[3] = 8'h00;
RAM[4] = 8'h00;
RAM[5] = 8'h00;
RAM[6] = 8'h00;
RAM[7] = 8'h00;
RAM[8] = 8'h00;
RAM[9] = 8'h00;
RAM[10] = 8'h00;
RAM[11] = 8'h00;
RAM[12] = 8'h00;
RAM[13] = 8'h00;
RAM[14] = 8'h00;
RAM[15] = 8'h00;
RAM[16] = 8'h00;
RAM[17] = 8'h00;
RAM[18] = 8'h00;
RAM[19] = 8'h00;
RAM[20] = 8'h00;
RAM[21] = 8'h00;
RAM[22] = 8'h00;
RAM[23] = 8'h02;
RAM[24] = 8'h00;
RAM[25] = 8'h00;
RAM[26] = 8'h00;
RAM[27] = 8'h02;
RAM[28] = 8'h00;
RAM[29] = 8'h00;
RAM[30] = 8'h00;
RAM[31] = 8'h00;
RAM[32] = 8'h00;
RAM[33] = 8'h00;
RAM[34] = 8'h00;
RAM[35] = 8'h00;
RAM[36] = 8'h00;
RAM[37] = 8'h00;
RAM[38] = 8'h00;
RAM[39] = 8'h00;
RAM[40] = 8'h00;
RAM[41] = 8'h00;
RAM[42] = 8'h00;
RAM[43] = 8'h00;
RAM[44] = 8'h00;
RAM[45] = 8'h00;
RAM[46] = 8'h00;
RAM[47] = 8'h00;
RAM[48] = 8'h00;
RAM[49] = 8'h00;
RAM[50] = 8'h00;
RAM[51] = 8'h00;
RAM[52] = 8'h00;
RAM[53] = 8'h00;
RAM[54] = 8'h00;
RAM[55] = 8'h00;
RAM[56] = 8'h00;
RAM[57] = 8'h00;
RAM[58] = 8'h00;
RAM[59] = 8'h00;
RAM[60] = 8'h00;
RAM[61] = 8'h00;
RAM[62] = 8'h00;
RAM[63] = 8'h00;
RAM[64] = 8'h00;
RAM[65] = 8'h00;
RAM[66] = 8'h00;
RAM[67] = 8'h00;
RAM[68] = 8'h00;
RAM[69] = 8'h00;
RAM[70] = 8'h00;
RAM[71] = 8'h00;
RAM[72] = 8'h00;
RAM[73] = 8'h00;
RAM[74] = 8'h00;
RAM[75] = 8'h00;
RAM[76] = 8'h00;
RAM[77] = 8'h00;
RAM[78] = 8'h00;
RAM[79] = 8'h00;
RAM[80] = 8'h00;
RAM[81] = 8'h00;
RAM[82] = 8'h00;
RAM[83] = 8'h01;
RAM[84] = 8'h00;
RAM[85] = 8'h00;
RAM[86] = 8'h00;
RAM[87] = 8'h04;
RAM[88] = 8'h00;
RAM[89] = 8'h00;
RAM[90] = 8'h00;
RAM[91] = 8'h00;
RAM[92] = 8'h00;
RAM[93] = 8'h00;
RAM[94] = 8'h00;
RAM[95] = 8'h00;
end
assign douta={{RAM[addra]},{RAM[addra+1]},{RAM[addra+2]},{RAM[addra+3]}};
integer i;
always @ (posedge clka)
begin
    if (wea) begin
        begin
            { {RAM[addra]},{RAM[addra+1]},{RAM[addra+2]},{RAM[addra+3]}}=dina;
        end           
    end  
end

//write flag作为字节或字半字操作的标志

endmodule
