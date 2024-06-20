.data
	a: .word 13
	b: .word 47
	c: .word 10
	
.text
.globl main

main:
	lw $t0, a
	lw $t1, b
	lw $t2, c
	bne $t0, $t1, THEN
	ELSE:
		sub $t2, $t0, $t1 # c = a - b
		add $t0, $t1, $t2 # a = b + c	
		j FIM
	THEN:
		sub $t1, $t0, $t2 # b = a - c
		add $t2, $t1, $t2 # c = b + c
FIM:
	sw $t0, a
	sw $t1, b
	sw $t2, c
	li $v0, 10
	syscall