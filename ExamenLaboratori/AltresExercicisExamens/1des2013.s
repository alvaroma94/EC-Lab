	.data
	
matrix: .word 2, 0, 4, 8
	.word 1, 9, 3, 6
	.word 7, 5, 2, 4
	.word 0, 1, 5, 3
	
max:	.space 16

	.text
	.globl main
	
main: 	li $t0, 0 #i
	li $t2, 4 #constante para comparar los fors
	la $t3, matrix #@matrix
	la $t4, max #@max
	
fori:	bge $t0, $t2, fifori
	sll $t5, $t0, 2 #i*ncols   
	sll $t5, $t5, 2 #(i*ncols) + 0) * mbytes
	addu $t5, $t5, $t3 #@matrix + [(i*ncols) + 0) * mbytes]
	lw $t5, 0($t5)
	sll $t6, $t0, 2
	addu $t6, $t4, $t6
	sw $t5, 0($t6)
	li $t1, 1
	
forj:	bge $t1, $t2, fiforj
	sll $t7, $t0, 2
	addu $t7, $t7, $t1
	sll $t7, $t7, 2
	addu $t7, $t7, $t3
	lw $t7, 0($t7)
	lw $t8, 0($t6)
	bge $t8, $t7, fiif
	sw $t7, 0($t6)

fiif: 	addiu $t1, $t1, 1
	b forj

fiforj: addiu $t0, $t0, 1
	b fori

fifori: jr $ra
