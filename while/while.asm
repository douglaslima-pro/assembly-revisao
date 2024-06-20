.data
	i: .word 1
	soma: .word 0
	resultado: .asciiz "Soma = "
	quebraDeLinha: .asciiz "\n"

.text
.globl main

main:
	LOOP:
		lw $t0, i
		bne $t0, 10, LOOP_BEGIN # i != 10
		j IMPRIMIR_RESULTADO
		LOOP_BEGIN:
			lw $t1, soma
			add $t1, $t1, $t0 # soma = soma + 1
			sw $t1, soma
			addi $t0, $t0, 1 # i = i + 1
			sw $t0, i
			j LOOP
	
IMPRIMIR_RESULTADO:
	# "Soma = "
	la $a0, resultado
	li $v0, 4
	syscall
	# printa o valor de soma
	lw $t1, soma
	move $a0, $t1
	li $v0, 1
	syscall
	# printa uma quebra de linha
	la $a0, quebraDeLinha
	li $v0, 4
	syscall
	
FIM:
	li $v0, 10
	syscall