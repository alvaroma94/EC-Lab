	.data
result: .word 0
num:	.byte '7'

	.text
	.globl main
main:
	la $s0, num
	lbu  $s0, 0( $s0)
	li  $t0, 'a'
	li  $t1, 'z'
	blt  $s0,  $t0, AZor
	bgt  $s0,  $t1, AZor
	
yes:	
	la  $t2, result
	sw  $s0, 0( $t2)
	j final
	
AZor:
	li  $t0, 'A'
	li  $t1, 'Z'
	blt  $s0,  $t0, else
	bgt  $s0,  $t1, else
	j yes

else: 	li  $t0, '0'
	li  $t1, '9'
	blt  $s0,  $t0, cap
	bgt  $s0,  $t1, cap
	subu  $s0,  $s0,  $t0
	j yes
cap: 
	addiu  $t0,  $zero, -1
	la  $t1, result
	sw  $t0, 0( $t1)

final:
	jr  $ra
