# Prints the square of a number

SQUARE_MAX = 46340

main:
	# x in $t0
	# y in $t1

	la	$a0, prompt_str		# printf("Enter a number: ")
	li	$v0, 4			# mode 4: print_string
	syscall

	li	$v0, 5			# scanf("%d", x);
	syscall				# mode 5: read_int
	move	$t0, $v0

	ble	$t0, 100, if_true
	bge	$t0, 1000, if_true
	b	if_false

if_true:
	la	$a0, err_str		# printf("Enter a number: ")
	li	$v0, 4			# mode 4: print_string
	syscall

	b	if_end

if_false:
	mul	$t1, $t0, $t0		# y = x * x

	move	$a0, $t1		# printf("%d", y)
	li	$v0, 1			# mode 1: print_int
	syscall

	li	$a0, '\n'		# printf("\n")
	li	$v0, 11			# mode 11: print_char
	syscall

if_end:

	li	$v0, 0
	jr	$ra

	.data
prompt_str:
	.asciiz "Enter a number: "
err_str:
	.asciiz "square too big for 32 bits\n"