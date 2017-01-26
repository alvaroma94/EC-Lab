	.data
v:	.word 0, 3, 2, 1, 4, 5, 6, 7, 8, 9

k:	.word 0

	.text
	.globl main

subr2:
	li $t0, 4
	div $a0, $t0
	mfhi $v0
	jr $ra

subr:
	addiu $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	
	move $s0, $a0
	move $s1, $a1
	
	sll $t1, $s1, 2
	addu $t1, $t1, $s0
	lw $s1, 0($t1)
	sll $t2, $a2, 2
	addu $t2, $t2, $s0
	lw $t2, 0($t2)
	
	bge $s1, $t2, else
	ble $a2, $a1, else
	
	move $a0, $a2
	jal subr2
	
	move $t3, $v0
	sll $t3, $t3, 2
	addu $t3, $t3, $s0
	sw $s1, 0($t3)
	li $t4, 1
	move $v0, $t4
	b fiif

else:	
	li $t4, 0
	move $v0, $t4
	
fiif: 
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addiu $sp, $sp, 12
	jr $ra
	
main:
	addiu $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	
	move $s0, $zero
	li $t1, 8
	move $s1, $t1

for: 
	bge $s0, $s1, fifor
	la $t4, v
	move $a0, $t4
	move $a1, $s0
	addiu $t5, $s0, 2
	move $a2, $t5
	jal subr
	la $t2, k
	lw $t3, 0($t2)
	addu $t5, $v0, $t3
	sw $t5, 0($t2)
	addiu $s0, $s0, 1
	b for

fifor:
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addiu $sp, $sp, 12
	jr $ra
	