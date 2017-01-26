	.data
M:	.word	2,0,0,0,0,-2,
		0,-3,0,0,3,0,
		0,0,1,-1,0,0,
		0,0,-5,5,0,0,
		0,2,0,0,-2,0,
		-3,0,0,0,0,3
sum1:	.word	0
sum2:	.word	0

	.text
	.globl main
main:
	xor $s0, $s0, $s0 #i = 0
	la $t0, sum1
	la $t1, sum2
	lw $s1, 0($t0) #aux1 = sum1
	lw $s2, 0($t1) #aux2 = sum2
for:
	li $t0, 6
	bge $s0, $t0, fifor
	
	mult $s0, $t0
	mflo $t0
	addu $t0, $t0, $s0
	sll $t0, $t0, 2
	la $t1, M
	addu $t0, $t1, $t0
	lw $t0, 0($t0) #M[i][i]
	addu $s1, $s1, $t0 #aux1 += M[i][j]
	
	li $t0, 5
	mult $s0, $t0
	mflo $t0
	addiu $t0, $t0, 5
	sll $t0, $t0, 2
	la $t1, M
	addu $t0, $t0, $t1
	lw $t0, 0($t0) #M[i][5-i]
	addu $s2, $s2, $t0 #aux2 += M[i][5-i]
	
	addiu $s0, $s0, 1
	b for
fifor:
	la $t0, sum1
	la $t1, sum2
	sw $s1, 0($t0) #sum1 = aux1
	sw $s2, 0($t1) #sum2 = aux2
	
	jr $ra
	
	