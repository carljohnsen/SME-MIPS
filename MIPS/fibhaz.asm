ori $t0 $0 1
ori $t1 $0 1
ori $a0 $0 0
ori $t4 $0 10
sw $t0 0($a0)
addi $a0 $a0 4
sw $t1 0($a0)
addi $a0 $a0 4

loop:
lw $t0 -4($a0)
lw $t1 -8($a0)
add $t2 $t0 $t1
sw $t2 0($a0)
addi $a0 $a0 4
addi $t4 $t4 -1
bnez $t4 loop
j exit
# Should not execute!
sw $t2 0($0)
sw $t2 4($0)
sw $t2 8($0)
sw $t2 12($0)

exit:
nop
nop
nop
nop
nop
