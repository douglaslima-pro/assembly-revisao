.data
	i: .word 1
	produto: .word 1
	resultado: .asciiz "Produto = "
	quebraDeLinha: .asciiz "\n"
	
.text
.globl main

main:
	LOOP:
		lw $t0, i
		lw $t1, produto
		mult $t1, $t0 # produto * i
		mflo $t1 # produto = produto * i
		sw $t1, produto
		addi $t0, $t0, 1 # i = i + 1
		sw $t0, i
		bne $t0, 10, LOOP # i != 10

IMPRIMIR_RESULTADO:
	# "Produto = "
	la $a0, resultado
	li $v0, 4 # 4 = print(String)
	syscall
	# printa o valor do produto
	lw $t1, produto
	move $a0, $t1
	li $v0, 1 # 1 = print(int)
	syscall
	# printa uma quebra de linha
	la $a0, quebraDeLinha
	li $v0, 4 # 4 = print(String)
	syscall

FIM:
	li $v0, 10
	syscall