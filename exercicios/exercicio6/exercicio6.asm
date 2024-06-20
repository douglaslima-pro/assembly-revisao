.data
	i: .word 0
	termo: .word 1
	soma: .word 0
	resultado: .asciiz "\nSoma dos termos = "
	espaco: .asciiz " "
	quebraDeLinha: .asciiz "\n"
	
.text
.globl main

main:
	LOOP:
		lw $t0, i
		blt $t0, 10, LOOP_BEGIN
		j IMPRIMIR_RESULTADO
		LOOP_BEGIN:
			lw $t1, termo
			# imprime o termo
			move $a0, $t1
			li $v0, 1
			syscall
			# imprime um espaco
			la $a0, espaco
			li $v0, 4
			syscall
			# soma = soma + termo
			lw $t2, soma
			add $t2, $t2, $t1
			sw $t2, soma
			# termo = termo + 2
			addi $t1, $t1, 2
			sw $t1, termo
			# i = i + 1
			addi $t0, $t0, 1
			sw $t0, i
			j LOOP
IMPRIMIR_RESULTADO:
		# imprime "Soma dos termos = "
		la $a0, resultado
		li $v0, 4
		syscall
		# imprime o valor de soma
		lw $t2, soma
		move $a0, $t2
		li $v0, 1
		syscall
		# imprime uma quebra de linha
		la $a0, quebraDeLinha
		li $v0, 4
		syscall
FIM:
	li $v0, 10
	syscall