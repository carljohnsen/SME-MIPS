# Set the stack pointer
ori $sp 100

# Load data into memory
ori $1 $0 4
sw $1 0($0)
ori $1 $0 5
sw $1 1($0)
ori $1 $0 2
sw $1 2($0)
ori $1 $0 3
sw $1 3($0)
ori $1 $0 1
sw $1 4($0)
ori $1 $0 11
sw $1 5($0)
ori $1 $0 6
sw $1 6($0)
ori $1 $0 16
sw $1 7($0)

ori $a0 $0 0 # v
ori $a1 $0 0 # Left
ori $a2 $0 7 # Right

qsort:
bge $a1 $a2 return
#sll $t0 $a1 2 # Behøves ikke, da addresser pt er words og ikke byte
#add $t1 $a0 $0 # left.addr
lw $t0 ($a1) # tmp = v[left]
# Find pivot
add $t3 $a1 $a2 # $t3 = left + right
div $t3 $t3 2 # $t3 = $t3 / 2
lw $t2 ($t3) # $t2     = v[$t3]
sw $t2 ($a1) # v[left] = $t2
add $t9 $t2 $0 # $t9 = pivot
sw $t0 ($t3) # $v[$t3] = tmp

add $t5 $a1 $zero # last = left
addi $t4 $a1 1 # i = left
j condition

loop:
lw $t6 ($t4) # $t6 = v[i]
bge $t6 $t9 condition # if v[i] >= pivot
addi $t5 $t5 1 # last++
lw $t0 ($t5) # tmp = v[last]
sw $t6 ($t5) # v[last] = v[i]
sw $t0 ($t4) # v[i] = tmp

condition:
addi $t4 $t4 1 # i++
ble $t4 $a2 loop # if i <= Right
add $t0 $t9 $0 # $t0 = pivot
lw $t2 ($t5) # tmp = v[last]
sw $t2 ($t1) # v[left] = tmp
sw $t0 ($t5) # v[last] = pivot

subi $sp $sp 1 # sp--
sw $t5 ($sp) # mem[sp] = last
subi $sp $sp 1 # sp--
sw $a2 ($sp) # mem[sp] = right
subi $sp $sp 1 # sp--
sw $ra ($sp) # mem[sp] = return addr

subi $a2, $t5, 1 # right = last-1
jal qsort

lw $ra ($sp) # return addr = mem[sp]
addi $sp $sp 1 # sp++
lw $a2 ($sp) # right = mem[sp]
addi $sp $sp 1 # sp++
sw $a1 ($sp) # left = mem[sp]
addi $a1 $a1 1 # left++
sw $ra ($sp) # mem[sp] = return addr
jal qsort

lw $ra ($sp) # return addr = mem[sp]
addi $sp $sp 1 # sp++

return:
beqz $ra exit
jr $ra
exit:

