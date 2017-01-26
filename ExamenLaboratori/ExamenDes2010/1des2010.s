	.data

M: 	.word 2, 0, 0, 0, 0, -2
	.word 0, -3, 0, 0, 3, 0
	.word 0, 0, 1, -1, 0, 0
	.word 0, 0, -5, 5, 0, 0
	.word 0, 2, 0, 0, -2, 0
	.word -3, 0, 0, 0, 0, 3
	
sum1: 	.word 0
sum2: 	.word 0

	.text
	.globl main

main:
	li $t0, 0 #i
	la $t1, sum1
	la $t2, sum2
	la $t9, M
for:	
	li $t3, 6
	bge $t0, $t3, fifor
	
	lw $t4, 0($t1)
	mult $t0, $t3
	mflo $t3
	addu $t3, $t3, $t0
	sll $t3, $t3, 2
	addu $t3, $t3, $t9
	lw $t3, 0($t3)
	addu $t4, $t4, $t3
	sw $t4, 0($t1)
	
	lw $t5, 0($t2)
	li $t6, 5
	sub $t6, $t6, $t0
	li $t8, 6
	mult $t0, $t8
	mflo $t8
	addu $t8, $t8, $t6
	sll $t8, $t8, 2
	addu $t8, $t8, $t9
	lw $t8, 0($t8)
	addu $t5, $t5, $t8
	sw $t5, 0($t2)
	
	addiu $t0, $t0, 1
	b for
fifor:
	jr $ra