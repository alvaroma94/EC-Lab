	.data

V: .word 0, 3, 2, 1, 4, 5, 6, 7, 8, 9
k: .word 0

	.text
	.globl main

subr2: 
	li $t0, 4
	div $a0,$t0
	mfhi $v0
	jr $ra
	
subr:
	addiu $sp, $sp, -12 # apilo
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)

	move $s0,$a0 # @vector
	move $s1, $a1 # x

	sll $t0,$s1,2 # vector[x]
	addu $t0,$t0,$s0
	lw $t0,0($t0)

	sll $t1,$a2,2 # vector[y]
	addu $t1, $t1,$s0
	lw $t1,0($t1)

	bge $t0,$t1,else # if
	ble $a2,$s1,else

	move $a0, $a2 # preparacio parametres i crida funcio subr2
	jal subr2

	sll $t0,$s1,2 # vector[x]
	addu $t0,$t0,$s0
	lw $t0,0($t0) 
	sll $t1, $v0, 2 # vector[aux2]
	addu $t1, $t1,$s0
	sw $t0,0($t1)
	li $v0,1
	b fiif
else:
	move $v0, $zero

fiif:
	lw $s0,0($sp) # desapilo
	lw $s1,4($sp)
	lw $ra,8($sp)
	addiu $sp, $sp, 12 
	jr $ra

main:
	addiu $sp, $sp, -4
	sw $ra,0($sp)

	move $s0, $zero # i
	move $s1, $zero # k
for:
	li $t0, 8
	bge $s0,$t0, fifor

	la $a0, V # preparacio parametres
	move $a1,$s0
	addiu $a2, $s0,2
	jal subr # crida subr
	addu $s1, $s1, $v0
	addiu $s0, $s0, 1
	b for
fifor:
	la $t0, k
	sw $s1,0($t0)

	lw $ra,0($sp)
	addiu $sp, $sp, 4

	jr $ra