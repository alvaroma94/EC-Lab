
	.data
V:	.word	0,3,2,1,4,5,6,7,8,9
k:	.word	0

	.text
	.globl main
	
subr2:
	# INSERT CODE
	
subr:
	# INSERT CODE
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $s2, k
	
	li $s0, 0
	li $s1, 8
for:
	bge $s0, $s1, finFor

	la $a0, V
	move $a1, $s0
	addiu $a2, $s0, 2
	jal subr
	lw $t0, 0($s2)
	addu $t0, $t0, $v0
	sw $t0, 0($s2)
	
	addiu $s0, $s0, 1
	b for

finFor:
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra