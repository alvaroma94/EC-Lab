	.data
	
a: 	.word 10, 10, 10, 10
x: 	.word 0, 1, 2, 2
	.word 1, 0, 1, 2
	.word 2, 1, 0, 1
	.word 2, 2, 1, 0
	
	.text
	.globl main
	
main:
	li $t0, 0 # i
	li $t1, 0 # j
	li $t2, 3
	la $t3, x
	la $t7, a
	
while:
	bge $t0, $t2, fiwhile
	addiu $t4, $t1, 1
	beq $t4, $t0, if
	addiu $t5, $t0, 1
	bne $t5, $t1, fiif
	
if:
	lw $t9, 0($t7)
	lw $t8, 0($t3)
	addu $t8, $t9, $t8
	sw $t8, 0($t6)
	
fiif: 	
	bge $t1, $t2, else
	addiu $t1, $t1, 1
	b fielse

else:
	addiu $t0, $t0, 1
	move $t1, $zero
	
fielse:
	addiu $t3, $t3, 4 # stride
	addiu $t7, $t7, 4 # stride
	b while
	
fiwhile:
	jr $ra
	 