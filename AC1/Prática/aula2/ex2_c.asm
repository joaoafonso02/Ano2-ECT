	.data
 	.text
 	.globl main
 	
main: 	li $t0,2 	  # Carrega para $t0 o valor desejado
 	srl $t1,$t0,1     # Shift right logical de 1 bit para $t1
 	xor $t1,$t0,$t1   # Xor de $t0 e $t1, fazendo o código de gray
 	jr $ra 		  # fim do programa	
