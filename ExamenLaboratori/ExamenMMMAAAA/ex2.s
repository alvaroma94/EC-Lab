.data
mat: .word 1,2,3,4,5,6,7,8,9,8,7,6,5,4,3,2,1,2,3,4
v:      .word 0,0,0,0,0,0,0,0
        .text
        .globl main
main:
        li $t0, 5       #condicio sortida for1
        li $t1, 4       #condicio sortida for2 + stride
        la $t2, mat     #@mat
        la $t3, v               #@v
        li $t4, 0       #i
 
        for1:   bge $t4, $t0, fifor1
        	li $t5, 0       #j
        	
        for2:   bge $t5, $t1, fifor2
        	lw $t6, 0($t2)          #mat[i][j]
        	subu $t7, $t4, $t5
        	addiu $t7, $t7, 3
        	mult $t7, $t1
       	 	mflo $t7
        	addu $t7, $t7, $t3
        	lw $t8, 0($t7)          #@v[i - j + 3]
        	addu $t8, $t8, $t6      #@v[i - j + 3]+= M[i][j]
        	sw $t8, 0($t7)
        	addiu $t5, $t5, 1       #++j
        	addu $t2, $t2, $t1      #@ mat+1
        	b for2
        	
        fifor2: addiu $t4, $t4, 1       #++i
        	b for1
        	
	fifor1: jr $ra