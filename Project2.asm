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

