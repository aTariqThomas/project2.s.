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
	
	check_the_string:
	
	lb $t5, 0($a0)
	
	beqz $t5, prepare_for_the_convsn
	
	beq $t5, $t1, prepare_for_the_convsn #branches if equal
	
	slti $t6, $t5, 48
	
	bne $t6, $zero, error_invalidInpt
	
	slti $t6, $t5, 58
	
	bne $t6, $zero, step_char_forward
	
	slti $t6, $t5, 65

	bne $t6, $zero, error_invalidInpt
	
	slti $t6, $t5, 91                 # This basically does : 65 + N - 10
	
	bne $t6, $zero, step_char_forward
	
	slti $t6, $t5, 97
	
	bne $t6, $zero, error_invalidInpt
	
	slti $t6, $t5, 122                # This basically does : 97 + N - 10
	
	bne $t6, $zero, step_char_forward
	
	bgt $t5, 124, error_invalidInpt   # This basically does : 97 + N - 9
	
	step_char_forward:
	
	addi $a0, $a0, 1
	
	j check_the_string
	
	prepare_for_the_convsn:
	move $a0, $t4
	
	addi $t7, $t7, 0 #Adds the registers together 
	
	add $s0, $s0, $t0
	
	addi $s0, $s0, -1	
	
	li $s3, 3
	
	li $s2, 2
	
	li $s1, 1
	
	li $s5, 0
	
	base_convert_input:
	lb $s4, 0($a0)
	
	beqz $s4, print_result
	
	beq $s4, $t1, print_result
	
	slti $t6, $s4, 58

	bne $t6, $zero, base_10_conversion
	
	slti $t6, $s4, 88
	
	bne $t6, $zero, base_33_upper_conversion
	
	slti $t6, $s4, 120
	
	bne $t6, $zero, base_33_lower_conversion

	base_33_upper_conversion:
	#This function handles the upper conversions
	
	addi $s4, $s4, -55
	j serialize_number_for_the_result

	base_33_lower_conversion:
	
	#This function handles the lower conversions
	
	addi $s4, $s4, -87
	
	base_10_conversion:
	
	addi $s4, $s4, -48 
	
	j serialize_number_for_the_result
	
	serialize_number_for_the_result:
	beq $s0, $s3, firstDigit
	
	beq $s0, $s2, secndDigit
	
	beq $s0, $s1, thrdDigit
	
	beq $s0, $s5, fourthDigit
	
	firstDigit:
	 # The next line does (base N)^3
	li $s6, 46656
	mult $s4, $s6
	mflo $s7
	add $t7, $t7, $s7
	addi $s0, $s0, -1
	addi $a0, $a0, 1
	j base_convert_input #jump to this function
	
	secndDigit:
	#The next line basically does (base N)^2
	li $s6, 1296 
	mult $s4, $s6
	mflo $s7
	add $t7, $t7, $s7
	addi $s0, $s0, -1
	addi $a0, $a0, 1
	j base_convert_input #jump to this function
	
	thrdDigit:
	#The next line basically does (base N)^1
	li $s6, 36
	mult $s4, $s6
	mflo $s7
	add $t7, $t7, $s7
	addi $s0, $s0, -1
	addi $a0, $a0, 1
	j base_convert_input #jump to this function
	
	fourthDigit:
	li $s6, 1
	mult $s4, $s6
	mflo $s7
	add $t7, $t7, $s7


	print_result:

# This function prints the results 
	li $v0, 1
	move $a0, $t7
	syscall

j exit

