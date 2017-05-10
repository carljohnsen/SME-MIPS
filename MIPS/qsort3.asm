ori $sp $0 0x1000
or $a0 $0 $gp

# load(int *a)
ori $t0 $0 5
sw $t0 0($a0)
ori $t0 $0 8
sw $t0 4($a0)
ori $t0 $0 2
sw $t0 8($a0)
ori $t0 $0 9
sw $t0 12($a0)
ori $t0 $0 1
sw $t0 16($a0)
ori $t0 $0 3
sw $t0 20($a0)
ori $t0 $0 10
sw $t0 24($a0)
ori $t0 $0 4
sw $t0 28($a0)

ori $a2 $0 7
jal quicksort
j exit

# partition(int *a, int p, int r)
partition:
sll $t0 $a1 2 # offset
add $t1 $a0 $t0 # addr+offset
lw $t2 0($t1) # x
addi $t3 $a1 -1 # i
addi $t4 $a2 1 # j
while:
repeat1:
addi $t4 $t4 -1
sll $t0 $t4 2
add $t0 $a0 $t0
lw $t5 0($t0)
bgt $t5 $t2 repeat1
repeat2:
addi $t3 $t3 1
sll $t1 $t3 2
add $t1 $a0 $t1
lw $t6 0($t1)
blt $t6 $t2 repeat2
# if
bge $t3 $t4 false
true:
sw $t6 0($t0)
sw $t5 0($t1)
j while
false:
or $v0 $0 $t4 # return j
jr $ra

# quicksort(int *a, int p, int r)
quicksort:
bge $a1 $a2 else
addi $sp $sp 12
sw $ra -12($sp)
sw $a2 -8($sp)
jal partition
sw $v0 -4($sp)
or $a2 $v0 $0
jal quicksort
lw $v0 -4($sp)
addi $a1 $v0 1
lw $a2 -8($sp)
jal quicksort
addi $sp $sp -12
lw $ra 0($sp)
else:
jr $ra

exit:
nop
nop
nop
nop
nop
