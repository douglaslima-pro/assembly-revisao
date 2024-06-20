.data
	i: .word 0
	j: .word 0
	f: .word 0
	g: .word 0
	h: .word 0
	
.text
.globl main

main:
	lw $t0, i
	lw $t1, j
	lw $t2, f
	lw $t3, g
	lw $t4, h
	beq $t0, $t1, THEN
	ELSE:
		sub $t2, $t3, $t4
		j FIM
	THEN:
		add $t2, $t3, $t4
FIM:
	sw $t2, f
	li $v0, 10
	syscall