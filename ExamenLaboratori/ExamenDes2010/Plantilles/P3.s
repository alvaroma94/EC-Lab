
	.data
V:	.space	1024

	.text
	.globl main
main:
	li $s0, 0	# i = 0
	li $s1, 0	# sum = 0
	li $s2, 4	# STRIDE = 4

while:
	li $t0, 256
	bge $s0, $t0, finWhile
	
	la $t0, V
	sll $t1, $s0, 2
	addu $t0, $t0, $t1	# t0 = @V[i]
	
	lw $t0, 0($t0)
	addu $s1, $s1, $t0	# sum += V[i]
	
	addu $s0, $s0, $s2	# i += stride
	b while
	
finWhile:
	jr $ra
