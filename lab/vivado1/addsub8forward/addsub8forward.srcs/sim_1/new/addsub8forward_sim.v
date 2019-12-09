`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2019 09:17:09 PM
// Design Name: 
// Module Name: addsub8forward_sim
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
module simadder(
    );
    // Inputs
        reg [7:0] A;
        reg [7:0] B;
        reg C0;
    // Outputs
        wire C8;
        wire [7:0] F;
    // Instantiate the Unit Under Test (UUT)
      add_8 uut 
               (.a(A), 
              .b(B), 
              .cin(C0), 
              .co(C8), 
              .s(F)
                 );
     initial begin
            // Initialize Inputs
                    C0 = 0;
            // Wait 100 ns for global reset to finish
            #100;
    // Add stimulus here
        begin A = 'B01101100;B='B01101011;C0 = 0;end
            #100;
            begin A = 'B10001011;B='B10000010;C0 = 1;end
            #100;
            begin A = 'B00111011;B='B10011101;C0 = 0;end
            #100;
            begin A = 'B11001010;B='B10000010;C0 = 1;end
            #100;
            A = 'B01000111;B='B01101000;C0= 0;
            #100;
            begin A = 'B00101011;B='B00101100;C0 = 1;end
            #100;
            begin A = 'B11001001;B='B01010001;C0 = 0;end
            #100;
        end
endmodule

