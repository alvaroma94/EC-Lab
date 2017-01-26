	.data
w:        .asciiz "8754830094826456674949263746929"
resultat: .byte 0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	la	$a0, w
	li	$a1, 31
	jal	moda
	la	$s0, resultat
	sb	$v0, 0($s0)
	move	$a0, $v0
	li	$v0, 11
	syscall
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra

nofares:
	li	$t0, 0x12345678
	move	$t1, $t0
	move	$t2, $t0
	move	$t3, $t0
	move	$t4, $t0
	move 	$t5, $t0
	move	$t6, $t0
	move 	$t7, $t0
	move 	$t8, $t0
	move 	$t9, $t0
	move	$a0, $t0
	move	$a1, $t0
	move	$a2, $t0
	move	$a3, $t0
	jr	$ra


moda:
# ESCRIU AQUI EL TEU CODI
	addiu $sp, $sp, -60
	sw $ra, 40($sp)
	sw $s0, 44($sp)
	sw $s1, 48($sp)
	sw $s2, 52($sp)
	sw $s3, 56($sp)
	move $s1, $zero #k=0
	move $s2, $a1
	move $s3, $a0
	
primer_bucle:
	li $t7, 10
	bge $s1, $t7, fi_primer_bucle
	sll $t6, $s1, 2
	addu $t5, $sp, $t6
	sw $zero, 0($t5)
	addiu $s1, $s1, 1
	b primer_bucle
	
fi_primer_bucle:
	li $t4, '0'
	move $s1, $zero #k=0
	
segon_bucle:
	bge $s1, $s2, fi_bucle
	move $a0, $sp
	addu $a1, $s3, $s1
	lbu $a1, 0($a1)
	subu $a1, $a1, $t4
	subu $a2, $s0, $t4
	jal update
	li $t4, '0'
	addu $s0, $v0, $t4
	addiu $s1, $s1, 1
	j segon_bucle

fi_bucle:
	move $v0, $s0
	lw $ra, 40($sp) 
	lw $s0, 44($sp)
	lw $s1, 48($sp)
	lw $s2, 52($sp)
	lw $s3, 56($sp)
	addiu $sp, $sp, 60
	jr $ra
	
update:
# ESCRIU AQUI EL TEU CODI
	addiu $sp, $sp, -16
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a2, 12($sp)
	
	jal nofares
	
	lw $t2, 12($sp)
	lw $t1, 8($sp)
	lw $t0, 4($sp)
	lw $ra, 0($sp)
	
	addiu $sp, $sp, 16
	sll $t3, $t1, 2 #i
	addu $t3, $t0, $t3
	
	lw $t5, 0($t3)
	addiu $t5, $t5, 1
	sw $t5, 0($t3)
	
	sll $t6, $t2, 2
	addu $t4, $t0, $t6
	lw $t4, 0($t4)
	bgt $t5, $t4, orif
	move $v0, $t2
	jr $ra
	
orif:
	move $v0, $t1
	jr $ra
