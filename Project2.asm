#Tariq Thomas 
#Student ID is @02845739

# My N is 36 (N = 36)






.data

  long_Inpt:    .asciiz "Input is too long."
  
  empty_Inpt:   .asciiz "Input is empty."
  
  user_Inpt:    .space  500
  
  invalid_Inpt: .asciiz "Invalid base-N number." # change n
  
  .text

 main:
exit:
  li $v0, 10
  
  # The Syscall will execute the function call basically 
  syscall 
  
  error_emptyInpt:

# This function will be called if there is no input

  la $a0, empty_Inpt
  
  li $v0, 4
  
  syscall
  j exit
  
  error_invalidInpt:
  la $a0, invalid_Inpt
  li $v0, 4
  syscall
  j exit
  
  error_has_longInpt:


  la $a0, long_Inpt
  li $v0, 4
  
   syscall
  j exit

  
#This is the beginning of the main function

  li $v0, 8
  
  la $a0, user_Inpt
  
  li $a1, 250
  
  syscall
  
  delete_left_pad:
	li $t8, 32 # This adds a space
	
	lb $t9, 0($a0)

	beq $t8, $t9, delete_the_firstCharacter # Calls the function with the label titled : delete_the_firstCharacter
	
	move $t9, $a0
	
	j input_the_length


	delete_the_firstCharacter:
	
	addi $a0, $a0, 1
	
	j delete_left_pad #jumps to delete_left_pad
	
	input_the_length:
	
	addi $t0, $t0, 0
	
	addi $t1, $t1, 10
	
	add $t4, $t4, $a0

	len_iteration:
	
	lb $t2, 0($a0)
	
	beqz $t2, after_the_length_is_found #branches if equal to zero
	beq $t2, $t1, after_the_length_is_found #branches if equal
	
	addi $a0, $a0, 1
	addi $t0, $t0, 1
	j len_iteration

	after_the_length_is_found:
	
	beqz $t0, error_emptyInpt
	
	slti $t3, $t0, 5
	
	beqz $t3, error_has_longInpt
	
	move $a0, $t4
	j check_the_string
