

		.data
		
mat:		.word 0, 0, 2, 0, 0, 0
		.word 0, 0, 4, 0, 0, 0
		.word 0, 0, 6, 0, 0, 0
		.word 0, 0, 8, 0, 0, 0
	
resultat:	.word 0

		.text
		.globl main
		
main:		addiu $sp, $sp, -4
		sw    $ra, 0($sp)
		la    $a0, mat
		jal   suma_col
		la    $t0, resultat
		sw    $v0, 0($t0)
		lw    $ra, 0($sp)
		addiu $sp, $sp, 4
		jr    $ra
		
suma_col:	addiu $t0, $a0, 8
		addu  $t2, $zero, $zero
		addiu $t1, $t0, 96
next:		lw    $t3, 0($t0)
		addu  $t2, $t2, $t3
		addiu $t0, $t0, 24
		bltu  $t0, $t1, next
		addu  $v0, $zero, $t2
		jr    $ra