.data
	i: .word 0
	elemento: .word 1
	soma: .word 0
	espaco: .asciiz " "
	resultado: .asciiz "\nSoma dos elementos = "
	quebraDeLinha: .asciiz "\n"
	
.text
.globl main

main:
	LOOP:
		lw $t0, i
		blt $t0, 16, LOOP_BEGIN
		j IMPRIMIR_RESULTADO
		LOOP_BEGIN:
			# imprime o elemento
			lw $t1, elemento
			move $a0, $t1
			li $v0, 1
			syscall
			# imprime o caractere de espaço
			la $a0, espaco
			li $v0, 4
			syscall
			# soma = soma + elemento
			lw $t2, soma
			add $t2, $t2, $t1
			sw $t2, soma
			# elemento = elemento + 3
			addi $t1, $t1, 3
			sw $t1, elemento
			# i = i + 1
			addi $t0, $t0, 1
			sw $t0, i
			# pula para a label LOOP
			j LOOP
	
IMPRIMIR_RESULTADO:
	# imprime "Soma = "
	la $a0, resultado
	li $v0, 4
	syscall
	# imprime o valor de soma
	lw $t3, soma
	move $a0, $t3
	li $v0, 1
	syscall
	# imprime a quebra de linha
	la $a0, quebraDeLinha
	li $v0, 4
	syscall

FIM:
	li $v0, 10
	syscall