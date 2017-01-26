	.data
A:	.word 3,5,7
punter:	.word 0
	
	.text
	.globl main
main:
	la $t0,A
	addiu $t0,$t0,8
	la $t1,punter
	
	sw $t0,0($t1)
	lw $s0,0($t1)
	lw $s0,0($s0)
	addiu $s0,$s0,2
	
	lw $t3,0($t1)
	lw $t3,-8($t3)
	addu $s0,$s0,$t3
	
	la $t0,A
	addiu $t0,$t0,4
	sw $s0,0($t0)
	
	li $v0,1
	move $a0,$s0
	syscall
	
	jr $ra
	