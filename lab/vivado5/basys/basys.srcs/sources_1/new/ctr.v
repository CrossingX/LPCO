`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2019 02:57:29 PM
// Design Name: 
// Module Name: ctr
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
module ctr(
    input [5:0] opCode,
    input [5:0] funct,
    
    output reg regDst,
    output reg aluSrcA,
    output reg [1:0] aluSrcB,
    output reg memToReg,
    output reg regWrite,
    output reg memRead,
    output reg memWrite,
    output reg branch,
    output reg [2:0] aluop,
    output reg jmp,
    output reg jal,
    output reg jr,
    output reg lui,
    output reg bne,
    output reg bltz,
    output reg bgtz,
    output reg imm_expand, //0 is signext, 1 is zeroext
    output reg [1:0] flag,
    output reg Write_hi,
    output reg Write_lo
);


always @(opCode,funct)
begin
    //mfhi, mflo
    if(opCode==6'b000000 && funct==6'b010000)begin Write_hi=1; Write_lo=0; end
    else if(opCode==6'b000000 && funct==6'b010010)begin Write_hi=0; Write_lo=1; end
    else begin Write_hi=0; Write_lo=0; end
end 


always @(opCode,funct) 
begin
    case(opCode)
        6'b001111:    //lui
        begin
            regDst = 0;
            aluSrcA = 0;
            aluSrcB = 2'b00;
            memToReg = 0;
            regWrite = 1;
            memRead = 0;
            memWrite = 0;
            branch = 0;
            aluop = 3'b000;
            jmp = 0;
            jal=0;
            jr=0;   
            lui=1;   
            bne=0;
            bltz=0;
            bgtz=0; 
            imm_expand=0; 
            flag=2'b11;   
        end    
        6'b000010: // j
        begin
            regDst = 0;
            aluSrcA = 0;
            aluSrcB = 2'b00;
            memToReg = 0;
            regWrite = 0;
            memRead = 0;
            memWrite = 0;
            branch = 0;
            aluop = 3'b000;
            jmp = 1;
            jal=0;
            jr=0;
            lui=0;
            bne=0; 
            bltz=0;
            bgtz=0; 
            imm_expand=0;
            flag=2'b11;         
        end
        6'b000011: // Jal��ָ��
        begin
            regDst = 0;
            aluSrcA = 0;
            aluSrcB = 2'b00;
            memToReg = 0;
            regWrite = 1;
            memRead = 0;
            memWrite = 0;
            branch = 0;
            aluop = 3'b000;
            jmp = 1;
            jal=1;
            jr=0;
            lui=0;
            bne=0; 
            bltz=0;
            bgtz=0; 
            imm_expand=0;   
            flag=2'b11;       
        end        
        6'b000000: // R��ָ��
        begin
            regDst = 1;
            memToReg = 0;
            memRead = 0;
            memWrite = 0;
            branch = 0;
            aluop = 3'b111;
            jmp = 0;
            jal=0;
            lui=0; 
            bne=0;
            bltz=0;
            bgtz=0; 
            imm_expand=0; 
            flag=2'b11;             
            
            if(funct==6'b001000) 
                begin regWrite = 0; jr=1;  end   //jr
            else if(funct==6'b011000||funct==6'b011010||funct==6'b010001||funct==6'b010011) 
                begin regWrite=0; jr=0;  end // mult div mthi mtlo
            else 
                begin regWrite = 1; jr=0;  end 
            
            if(funct==6'b000000||funct==6'b000010||funct==6'b000011) //sll,srl,sra
            begin aluSrcA=1'b1; aluSrcB = 2'b10;  end  //rt shamt
            else if(funct==6'b000100||funct==6'b000110||funct==6'b000111)//sllv srlv srav
            begin aluSrcA=1'b1; aluSrcB = 2'b11;  end  //rt rs
            else 
            begin aluSrcA=1'b0; aluSrcB = 2'b00;  end  //rs rt
        end
        6'b100011: // lw
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b01;
            memToReg = 1;
            regWrite = 1; 
            memRead = 1;
            memWrite = 0;
            branch = 0;
            aluop = 3'b000;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0; 
            bltz=0;
            bgtz=0;  
            imm_expand=0;     
            flag=2'b11;  
        end
        6'b100001: // lh
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b01;
            memToReg = 1;
            regWrite = 1;
            memRead = 1;
            memWrite = 0;
            branch = 0;
            aluop = 3'b000;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0; 
            bltz=0;
            bgtz=0;  
            imm_expand=0;     
            flag=2'b01;
        end   
        6'b100000: // lb
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b01;
            memToReg = 1;
            regWrite = 1;
            memRead = 1;
            memWrite = 0;
            branch = 0;
            aluop = 3'b000;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0; 
            bltz=0;
            bgtz=0;  
            imm_expand=0;     
            flag=2'b00;
        end              
        6'b101011: // sw
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b01;
            memToReg = 0;
            regWrite = 0;
            memRead = 0;
            memWrite = 1;
            branch = 0;
            aluop = 3'b000;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0;
            bltz=0;
            bgtz=0;  
            imm_expand=0; 
            flag=2'b11;  
        end
        6'b101001: // sh
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b01;
            memToReg = 0;
            regWrite = 0;
            memRead = 0;
            memWrite = 1;
            branch = 0;
            aluop = 3'b000;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0;
            bltz=0;
            bgtz=0;  
            imm_expand=0; 
            flag=2'b01;
        end    
        6'b101000: // sb
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b01;
            memToReg = 0;
            regWrite = 0;
            memRead = 0;
            memWrite = 1;
            branch = 0;
            aluop = 3'b000;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0;
            bltz=0;
            bgtz=0;  
            imm_expand=0; 
            flag=2'b00;       
        end              
        6'b000100: //beqָ��
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b00;
            memToReg = 0;
            regWrite = 0;
            memRead = 0;
            memWrite = 0;
            branch = 1;
            aluop = 3'b001;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0; 
            bltz=0;
            bgtz=0;   
            imm_expand=0; 
            flag=2'b11;     
        end
        6'b000101: //bneָ��
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b00;
            memToReg = 0;
            regWrite = 0;
            memRead = 0;
            memWrite = 0;
            branch = 1;
            aluop = 3'b001;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=1; 
            bltz=0;
            bgtz=0;  
            imm_expand=0; 
            flag=2'b11;        
        end 
        6'b000001: //bltzָ��
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b01;
            memToReg = 0;
            regWrite = 0;
            memRead = 0;
            memWrite = 0;
            branch = 0;
            aluop = 3'b001;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0; 
            bltz=1;
            bgtz=0;  
            imm_expand=0;   
            flag=2'b11;      
        end   
        6'b000111: //bgtzָ��
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b01;
            memToReg = 0;
            regWrite = 0;
            memRead = 0;
            memWrite = 0;
            branch = 0;
            aluop = 3'b001;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0;
            bltz=0;
            bgtz=1; 
            imm_expand=0; 
            flag=2'b11;       
        end                       
        6'b001000: // addiָ��
        begin
            regDst = 0;    
            aluSrcA = 1'b0;//
            aluSrcB = 2'b01;
            memToReg = 0;  //
            regWrite = 1;  //
            memRead = 0;   //
            memWrite = 0;  //
            branch = 0;    //
            aluop = 3'b000;//
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0;
            bltz=0;
            bgtz=0;   
            imm_expand=0; 
            flag=2'b11;       
        end
          6'b001001: // addiuָ��
              begin
                  regDst = 0;    
                  aluSrcA = 1'b0;//
                  aluSrcB = 2'b01;
                  memToReg = 0;  //
                  regWrite = 1;  //
                  memRead = 0;   //
                  memWrite = 0;  //
                  branch = 0;    //
                  aluop = 3'b000;//
                  jmp = 0;
                  jal=0;
                  jr=0;
                  lui=0; 
                  bne=0;
                  bltz=0;
                  bgtz=0;   
                  imm_expand=0; 
                  flag=2'b11;       
              end
        6'b001100: // andiָ��
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b01;  
            memToReg = 0;
            regWrite = 1;
            memRead = 0;
            memWrite = 0;
            branch = 0;
            aluop = 3'b010;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0;
            bltz=0;
            bgtz=0; 
            imm_expand=1; 
            flag=2'b11;                  
        end         
        6'b001101: // oriָ��
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b01;
            memToReg = 0;
            regWrite = 1;
            memRead = 0;
            memWrite = 0;
            branch = 0;
            aluop = 3'b011;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0;
            bltz=0;
            bgtz=0;  
            imm_expand=1;   
            flag=2'b11;      
        end              
        6'b001110: // xoriָ��
        begin
            regDst = 0;
            aluSrcA = 1'b0;
            aluSrcB = 2'b01;
            memToReg = 0;
            regWrite = 1;
            memRead = 0;
            memWrite = 0;
            branch = 0;
            aluop = 3'b100;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0;
            bltz=0;
            bgtz=0; 
            imm_expand=1;            
        end 
        6'b001010: // sltiָ��
        begin
            regDst = 0;     //rt
            aluSrcA = 1'b0; //rs
            aluSrcB = 2'b01;//SignImm
            memToReg = 0;
            regWrite = 1;
            memRead = 0;
            memWrite = 0;
            branch = 0;
            aluop = 3'b101;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0;
            bltz=0;
            bgtz=0;
            imm_expand=0;           
        end            
        6'b001011: // sltiuָ��
                begin
                    regDst = 0;     //rt
                    aluSrcA = 1'b0; //rs
                    aluSrcB = 2'b01;//SignImm
                    memToReg = 0;
                    regWrite = 1;
                    memRead = 0;
                    memWrite = 0;
                    branch = 0;
                    aluop = 3'b110;
                    jmp = 0;
                    jal=0;
                    jr=0;
                    lui=0; 
                    bne=0;
                    bltz=0;
                    bgtz=0;
                    imm_expand=0;           
                end                    
        default: // ȱʡֵ
        begin
            regDst = 0;
            aluSrcA = 1'b1;
            aluSrcB = 2'b00;
            memToReg = 0;
            regWrite = 0;
            memRead = 0;
            memWrite = 0;
            branch = 0;
            aluop = 3'b000;
            jmp = 0;
            jal=0;
            jr=0;
            lui=0; 
            bne=0; 
            bltz=0;
            bgtz=0;   
            imm_expand=0;        
        end
    endcase
end
endmodule
