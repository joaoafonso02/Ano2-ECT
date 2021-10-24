	.data
 	.text
 	.globl main
 	
main: 	li $t0,0x862A5C1B # instrução virtual (decomposta
 			  # em duas instruções nativas)
 	sll $t2,$t0,4 	  #  Shift left logical 
 	srl $t3,$t0,4     # Shift right logical
 	sra $t4,$t0,4     # Shift right arithmetic
 	jr $ra 		  # fim do programa	