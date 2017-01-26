	.data
signe:		.word 0
exponent:	.word 0
mantissa:	.word 0
cfixa:		.word 0x87D18A00
cflotant:	.float 0.0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)

	la	$t0, cfixa
	lw	$a0, 0($t0)
	la	$a1, signe
	la	$a2, exponent
	la	$a3, mantissa
	jal	descompon

	la	$a0, signe
	lw	$a0,0($a0)
	la	$a1, exponent
	lw	$a1,0($a1)
	la	$a2, mantissa
	lw	$a2,0($a2)
	jal	compon

	la	$t0, cflotant
	swc1	$f0, 0($t0)

	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr	$ra


descompon:
	slt $t0, $a0, $zero
	sw $t0, 0($a1)
	sll $a0, $a0, 1
	xor $t0, $t0, $t0
	beq $a0, $zero, final_if
	addiu $t0, $zero, 18
	blt $a0, $zero, final_while
while:
	sll $a0, $a0, 1
	addiu $t0, $t0, -1
	bge $a0, $zero, while
final_while:
	lui $t1, 0x7F
	ori $t1, $t1, 0xFFFF
	sra $a0, $a0, 8
	and $a0, $a0, $t1
	addiu $t0, $t0, 127
final_if:
	sw $t0, 0($a2)
	sw $a0, 0($a3)
	jr $ra
compon:
	sll $a0, $a0, 31
	sll $a1, $a1, 23
	or $a0, $a0, $a1
	or $a0, $a0, $a2
	mtc1 $a0, $f0
	jr $ra

