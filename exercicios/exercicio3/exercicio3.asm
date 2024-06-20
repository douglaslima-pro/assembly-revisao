.data
	a: .word 3
	b: .word 4
	c: .word 8
	
.text
.globl main

main:
	lw $t0, a
	lw $t1, b
	lw $t2, c
	beq $t0, $t1, THEN
	ELSE:
		add $t2, $t0, $t1 # c = a + b
		sub $t0, $t1, $t2 # a = b - c
		j FIM
	THEN:
		add $t1, $t0, $t2 # b = a + c
		sub $t2, $t1, $t2 # c = b - c
FIM:
	sw $t0, a
	sw $t1, b
	sw $t2, c
	li $v0, 10
	syscall