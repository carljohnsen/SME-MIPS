ori $t0 $0 1
ori $t1 $0 1
ori $a0 $0 0
ori $t4 $0 10
sw $t0 0($a0)
addi $a0 $a0 4
sw $t1 0($a0)
addi $a0 $a0 4

loop:
add $t2 $t0 $t1
or $t0 $t1 $0
or $t1 $t2 $0
sw $t1 0($a0)
addi $a0 $a0 4
addi $t4 $t4 -1
bnez $t4 loop