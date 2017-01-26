	.data
	
M: 	.word 1, 2, 3, 4
	.word 5, 6, 7, 8
	.word 9, 8, 7, 6
	.word 5, 4, 3, 2
	.word 1, 2, 3, 4

V: 	.word 0, 0, 0, 0, 0, 0, 0, 0

	.text
	.globl main
	
main:
	li $t0, 0 #i
	la $t1, M
	la $t2, V
	li $t3, 5
	li $t4, 4
	
fori: 	
	bge $t0, $t3, fifori
	li $t5, 0
	
forj:	
	bge $t5, $t4, fiforj
	sub $t6, $t0, $t5
	addiu $t6, $t6, 3
	sll $t6, $t6, 2
	addu $t6, $t6, $t2
	lw $t8, 0($t6)
	sll $t7, $t0, 2
	addu $t7, $t7, $t5
	sll $t7, $t7, 2
	addu $t7, $t7, $t1
	lw $t7, 0($t7)
	addu $t7, $t7, $t8
	sw $t7, 0($t6)
	addiu $t5, $t5, 1
	b forj
	
fiforj: 
	addiu $t0, $t0, 1
	b fori

fifori: 
	jr $ra