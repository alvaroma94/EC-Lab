	.data

files:		.word 1,2,3,4
columnes:	.word 1,3,1,4
M:		.word 0,0,0,0,0, 0,1,0,0,0 0,0,0,2,0 0,4,0,0,0 0,0,0,0,5
suma:		.word 1

	.text
	.globl main
	
main:
	addiu $sp, $sp, 20
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	sw $s3, 16($sp)
	
	move $s0, $zero #k
	li $t0, 4
	move $s1, $t0 #4
	move $s2, $zero #suma
	move $s3, $zero #STRIDE
	
for:
	bge $s0, $s1, fifor
	la $t1, files
	addu $t1, $t1, $s3
	lw $t1, 0($t1)
	la $t2, columnes
	addu $t2, $t2, $s3
	lw $t2, 0($t2)
	
	li $t3, 5
	mult $t1, $t3
	mflo $t3
	addu $t3, $t3, $t2
	sll $t3, $t3, 2
	la $t4, M
	addu $t3, $t4, $t3
	lw $t3, 0($t3)
	addu $s2, $s2, $t3
	
	addiu $s3, $s3, 4
	addiu $s0, $s0, 1
	b for

fifor:
	la $t7, suma
	lw $t6, 0 ($t7)
	addu $s2, $s2, $t6
	sw $s2, 0($t7)
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	addiu $sp, $sp, -20