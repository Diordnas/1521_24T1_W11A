	.text

SQUARE_MAX = 46340

# Prints the square of a number

main:
	# x stored in $t0
	# y stored in $t1

	li	$v0, 4			# mode 4: print string
	la	$a0, prompt_string	#
	syscall				# print("enter a number")

	li	$v0, 5			# mode 5: read int
	syscall				#
	move	$t0, $v0 		# scanf("%d", x);

	ble	$t0, SQUARE_MAX, square_number

	li	$v0, 4			# mode 4: print string
	la	$a0, second_string	#
	syscall				# print("number too big")

	b	end


square_number:
	mul	$t1, $t0, $t0		# y = x * x

	li	$v0, 1			# mode 1: print int
	move	$a0, $t1		#
	syscall				# print(y)

	li	$v0, 11 
	li	$a0, '\n'
	syscall

end:

	li	$v0, 0
	jr	$ra

	.data
prompt_string:
	.asciiz "Enter a number: "
second_string:
	.asciiz "square too big for 32 bits\n"