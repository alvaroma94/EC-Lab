	.data
fib:	.space 10
	.text
	.globl main
main:
	li $s0,2
	la $t2,fib
	sw $zero,0($t2)
	li $t1,1
	sw $t1,4($t2)
while:
	slti $t0,$s0,10
	beq $t0,$zero,fi
	la $s1,fib
	sll $s3,$s0,2
	addu $s3,$s1,$s3
	lw $s2,-4($s3)
	lw $s4,-8($s3)
	addu $s2,$s2,$s4
	sw $s2,0($s3)
	addiu $s0,$s0,1
	b while
fi:
	jr $ra