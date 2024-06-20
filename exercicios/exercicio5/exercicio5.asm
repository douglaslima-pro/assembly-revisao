.data
	a: .word 10
	b: .word 20
	c: .word 15

.text
.globl main

main:
	lw $t0, a
	lw $t1, b
	lw $t2, c
	blt $t0, $t1, THEN
	ELSE:
		mult $t0, $t1
		mflo $t2 # c = a * b
		sub $t0, $t1, $t2 # a = b - c
		j FIM
	THEN:
		mult $t0, $t2
		mflo $t1 # b = a * c
		sub $t2, $t1, $t2 # c = b - c
FIM:
	sw $t0, a
	sw $t1, b
	sw $t2, c
	li $v0, 10
	syscall