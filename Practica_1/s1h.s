	.data
cadena:	.byte -1,-1,-1,-1,-1,-1
vec:	.word 5,6,8,9,1
	.text
	.globl main
main:
	li $s0,0
while:	
	li $t0,5
	bge $s0,$t0,fi
	
	li $t1,4
	sub $t1,$t1,$s0
	la $s1,vec
	sll $t1,$t1,2
	addu $s1,$s1,$t1
	lbu $s2,0($s1)
	addiu $s2,$s2,48
	la $s3,cadena
	addu $s3,$s3,$s0
	sb $s2,0($s3)
	addiu $s0,$s0,1
	b while
fi:
	la $t5,cadena
	sb $zero,5($t5)
	li $v0,4
	la $a0,cadena
	
	jr $ra