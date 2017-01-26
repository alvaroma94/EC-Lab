	.data
	V1:	 .word  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	M: 	.space 1024
	V2:	.space 64
	.text
	.globl main

main: 
	addiu $t4, $zero, 4 # $t4 = 4
	addiu $t5, $zero, 16 # $t5 = 16
	la $t8, M
	
	xor $t0, $t0, $t0 # k = 0 equivalente a move $t0, $zero
	xor $t1, $t1, $t1 # i = 0 " " " " " " " " " " " " " " "
	xor $t2, $t2, $t2 # j = 0 " " " " " " " " " " " " " " "
	xor $t3, $t3, $t3 # temp = 0" " " " " " " " " " " " " " 
	
	sll $t6, $t0, 2
	addu $t6, $t6, $t2
	mult $t1, $t5
	mflo $t7
	addu $t