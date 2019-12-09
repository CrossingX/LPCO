addiu  $1,$0,8
addi $14, $0, 1
addu $16, $14, $1
label0:
subu $16, $14, $1
bgtz $16, label0
sltu $15, $0, $1
ori  $2,$0,2
add  $3,$2,$1
sub  $5,$3,$2
and  $4,$5,$2
or  $8,$4,$2
label1:
sll  $8,$8,1
bne $8,$1,label1
slti  $6,$2,4
slt  $7,$6,$1
label2: 
addiu $7,$7,8
beq $7,$1,label2
sw  $2,4($1)
lw  $9,4($1)
addiu  $10,$0,-2
label3:
addiu  $10,$10,1
bltz $10,label3
exit:
andi  $11,$2,2
xor $12, $1, $2
nor $13, $1, $2
srl $18, $12, 1
sllv $19 ,$12,$2
srlv $20 ,$12,$2
jal label4
j  exit
label4:
xori $17,$0, 1
lui $21, 9
sra $22, $1, 1
srav $23,$1, $2
sltiu $24,$1,0
jr $31
