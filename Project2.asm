.data

message: .asciiz "Hi user! Type something." #The code should print this string out.
userInput: .space 20 #Reserves 20 bytes of data for whatever the person types in
.text

main: 
li $v0, 8  #Tells the system to prepare to read the text from the user
la $a0, userInput #Stores the user's input into the register
li $a1, 20 #Tells the system the maximum length of the text
syscall #Exceutes the function


li $v0, 4 #Code to display text
la $a0, message
syscall #Executs the call to display the text in the 'message' label

li $v0, 10
syscall
#Basically indicates the end of 'main'.


