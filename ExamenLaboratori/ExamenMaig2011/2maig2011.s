	.data
	
V1: 	.word -32, 64, -10, 16, -20
V2:	.word 8, -70, 30, -17

suma1: 	.word 0
suma2: 	.word 0

	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, V1
	li $a1, 5
	jal subr1
	la $t0, suma1
	sw $v0, 0($t0)
	la $a0, V2
	li $a1, 4
	jal subr1	
	la $t0, suma2
	sw $v0, 0($t0)
	lw $ra, 0($sp)
	addiu $sp, $sp, -4
	jr $ra
	
subr1:
	addiu $sp, $sp, -20
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	sw $s3, 16($sp)
	
	move $s0, $zero #i
	move $s1, $a1 #x
	move $s2, $zero #aux
	move $s3, $a0 #*p
	
for:
	bge $s0, $s1, fifor
	lw $a0, 0($s3)
	move $a1, $s0
	jal subr2
	addu $s2, $s2, $v0
	addiu $s3, $s3, 4
	addiu $s0, $s0, 1
	b for

fifor: 
	move $v0, $s2
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	addiu $sp, $sp, 20
	jr $ra
	
subr2:	
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $t0, 2
	blt $a1, $t0, else
	li $t1, 3
	div $a0, $t1
	mfhi $t1
	b fiif

else:
	li $t1, 3
	div $a0, $t1
	mflo $t1
	
fiif: 	
	move $v0, $t1
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra