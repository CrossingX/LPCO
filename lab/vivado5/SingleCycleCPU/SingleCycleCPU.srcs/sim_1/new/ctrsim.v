`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2019 04:19:16 PM
// Design Name: 
// Module Name: ctrsim
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

module ctrsim; 
// Inputs 
reg [5:0] opCode; 
// Outputs 
wire regDst; 
wire aluSrcA;
wire [1:0]aluSrcB; 
wire memToReg; 
wire regWrite; 
wire memRead; 
wire memWrite; 
wire branch; 
wire [2:0] aluop; 
wire jmp; 
wire jal;
wire jr;
wire lui;
wire bne;
wire bltz;
wire bgtz;
wire imm_expand;
wire [1:0] flag;
wire Write_hi;
wire Write_lo;
// Instantiate the Unit Under Test (UUT) 
ctr uut ( 
.opCode(opCode), 
.regDst(regDst), 
.aluSrcA(aluSrcA), 
.aluSrcB(aluSrcB), 
.memToReg(memToReg), 
.regWrite(regWrite), 
.memRead(memRead), 
.memWrite(memWrite), 
.branch(branch), 
.aluop(aluop), 
.jmp(jmp),
.jal(jal),
.jr(jr),
.lui(lui),
.bne(bne),
.bltz(bltz),
.bgtz(bgtz),
.imm_expand(imm_expand),
.flag(flag),
.Write_hi(Write_hi),
.Write_lo(Write_lo)
); 
initial begin 
// Initialize Inputs 
opCode = 6'b000000; 
#100; 
opCode = 6'b000010; 
// Wait 100 ns for global reset to finish 
#100; 
opCode = 6'b110000; 
#100; 
opCode = 6'b100011; 
#100; 
opCode = 6'b000100; 
#100; 
opCode = 6'b001000; 
end 
endmodule 

