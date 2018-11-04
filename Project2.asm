.data

message: .asciiz "Hi user! Type something." #The code should print this string out.

.text

main: 

li $v0, 10
syscall
#Basically indicates the end of 'main'.
