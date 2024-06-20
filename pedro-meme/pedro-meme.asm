.data
	i: .word 0
	nome: .asciiz "Pedro "
	quebraDeLinha: .asciiz "\n"

.text
.globl main

main:
	LOOP:
		lw $t0, i
		blt $t0, 3, LOOP_BEGIN
		# "\n"
		la $a0, quebraDeLinha
		li $v0, 4
		syscall
		j FIM
		LOOP_BEGIN:
			# "Pedro "
			la $a0, nome
			li $v0, 4
			syscall
			addi $t0, $t0, 1 # i = i + 1
			sw $t0, i
			j LOOP

FIM:
	li $v0, 10
	syscall
