#SE COMPRUEBA MIRANDO QUE EL RESULTADO DEL VECTOR DE a[4] = {11, 12, 12, 11}	
	
	.data

a: 	.word 10, 10, 10, 10

x: 	.word 0, 1, 2, 2
	.word 1, 0, 1, 2
	.word 2, 1, 0, 1
	.word 2, 2, 1, 0
	
	.text
	.globl main
	
main: 
	la $t0, a
	la $t1, x
	li $t2, 0 #i
	li $t3, 3
	
while: 
	bgt $t2, $t3, fiwhile
	li $t4, 0 #j
	
if:
	addiu $t5, $t4, 1
	beq $t2, $t5, cond
	addiu $t6, $t2, 1
	bne $t6, $t4, ifj
	
cond: 	
	sll $t7, $t2, 2
	addu $t7, $t0, $t7
	lw $t9, 0($t7)
	sll $t8, $t2, 2
	addu $t8, $t8, $t4
	sll $t8, $t8, 2
	addu $t8, $t8, $t1
	lw $t8, 0($t8)
	addu $t8, $t8, $t9
	sw $t8, 0($t7)

ifj:	
	bge $t4, $t3, elsej
	addiu $t4, $t4, 1
	b if

elsej:
	addiu $t2, $t2, 1
	b while

fiwhile:
	jr $ra