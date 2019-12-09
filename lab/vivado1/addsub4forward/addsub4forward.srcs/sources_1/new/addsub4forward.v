`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2019 08:33:12 PM
// Design Name: 
// Module Name: addsub4forward
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

module chaoadder(A,B,C0,C4,F);
  input[3:0] A,B;
  input      C0;
  output[3:0] F;
  output      C4;
  wire[3:0]   A,B;
  reg [3:0]   F,G,P;
  reg        C4;
  reg  C1,C2,C3;
  always@(*)
  begin
       G[0]=A[0]&B[0];
       G[1]=A[1]&B[1];
       G[2]=A[2]&B[2];
       G[3]=A[3]&B[3];

       P[0]=A[0]|B[0];
       P[1]=A[1]|B[1];
       P[2]=A[2]|B[2];
       P[3]=A[3]|B[3];

       C1=G[0]|(P[0]&C0);
       C2=G[1]|(P[1]&C1);
       C3=G[2]|(P[2]&C2);
       C4=G[3]|(P[3]&C3);

       F[0]=A[0]^B[0]^C0;
       F[1]=A[1]^B[1]^C1;
       F[2]=A[2]^B[2]^C2;
       F[3]=A[3]^B[3]^C3;
  end
endmodule 

