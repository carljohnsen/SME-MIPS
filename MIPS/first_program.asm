addi $1 $0 0x5 # 5
addi $2 $0 0x2 # 2
add $3 $1 $2 # 7
add $4 $1 $3 # 12
add $5 $4 $4 # 24
sub $6 $5 $1 # 19
and $7 $1 $3 # 5
or  $8 $1 $3 # 7
slt $9 $1 $3 # 1
slt $10 $3 $1 # 0
sw $6 8 ($0) # address 8, M[8] = 19
lw $11 8 ($0) # address 8, $11 = M[8] = 19
beq $1 $7 skip1 # 0 ## should not write to register, but should jump the next
addi $12 $0 3 # 3 ## should not be executed
addi $12 $0 3 # 3 ## should not be executed
skip1:
addi $12 $0 15 # 15
addi $13 $3 -1 # -1

addi $14 $0 10 # 10
addi $15 $0 0 # i = 0
addi $17 $0 1 # 1 (true)

loop1:
addi $15 $15 1 # i++
slt $16 $15 $14 # i < 10
beq $16 $17 loop1 # if $16 == true: branch -3


j skip2 # jump to 30
addi $1 $0 55 ## should not be executed
addi $1 $0 55 ## should not be executed
addi $1 $0 55 ## should not be executed
addi $1 $0 55 ## should not be executed
addi $1 $0 55 ## should not be executed
addi $1 $0 55 ## should not be executed
skip2:
addi $18 $0 5555
ori $19 $0 5555


jal ret
addi $20 $0 15
j skip4
ret:
jr $31
skip4:
addi $21 $0 10

srl $22 $21 1
bne $21 $22 skip3
addi $23 $0 5555 ## should not be executed
skip3:
mult $21 $22 # 50
mflo $24 # 50
div $21 $22 # 2
mflo $25 # 2
addiu $26 $0 123 # 123
andi $27 $25 2 # 2
slti $28 $27 5 # 1
sltiu $29 $27 -1 # 1
addu $30 $27 $27 # 4
nor $31 $13 $13 # 0 ( eller 1?)
sltu $1 $27 $13 # 1
subu $2 $3 $2 # 5

