#Tariq Thomas 
#Student ID is @02845739

# My N is 36 (N = 36)






.data

  long_Inpt:    .asciiz "Input is too long."
  
  empty_Inpt:   .asciiz "Input is empty."
  
  user_Inpt:    .space  500
  
  invalid_Inpt: .asciiz "Invalid base-N number." # change n
  
  .text

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

   main:
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
