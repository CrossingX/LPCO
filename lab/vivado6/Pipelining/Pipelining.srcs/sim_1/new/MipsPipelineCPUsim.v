`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2019 04:21:38 PM
// Design Name: 
// Module Name: MipsPipelineCPUsim
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


module MipsPipelineCPUsim;
reg clk;
reg reset;
wire [31:0] inst_if;
wire [31:0] alu_res_ex;
wire [31:0] Dout_mem;
wire [31:0] RtData_id;
wire [31:0] PC_out;
    
MipsPipelineCPU uut(.clk(clk),.reset(reset),.inst_if(inst_if),
.alu_res_ex(alu_res_ex),.Dout_mem(Dout_mem),
.RtData_id(RtData_id),.PC_out(PC_out)
);
    
initial begin 
    // Initialize Inputs 
    clk = 0; 
    reset = 1; 
    // Wait 100 ns for global reset to finish 
    #10; 
    reset = 0; 
    end 
    parameter PERIOD = 20; 
    always begin 
    clk = 1'b0; 
    #(PERIOD / 2) clk = 1'b1; 
    #(PERIOD / 2) ; 
end 

endmodule
