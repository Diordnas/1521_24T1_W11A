# char *string = "....";
# char *s = &string[0];
# int   length = 0;
# while (*s != '\0') {
#    length++;  // increment length
#    s++;       // move to next char
# }

main:

main__prologue:
	push	$ra		# push $ra onto the stack (preserve it)

main__body:
	la	$a0, string	# get_str_len(string)
	jal	get_str_len

main__epilogue:
	pop	$ra		# pop $ra off the stack (recover the preserved value)

	jr	$ra		# return



get_str_len:
	# s in $t0
	# length in $t1

get_str_len__prologue:
	move	$t0, $a0			# argument: the string to get the length of

get_str_len__body:

get_str_len__loop_init:
	li	$t1, 0				# int length = 0

get_str_len__loop_cond:
	lb	$t2, ($t0)			# while *s != '\0' {
	beq	$t2, '\0', get_str_len__loop_end

get_str_len__loop_incr:
	add	$t0, $t0, 1			# s++
	add	$t1, $t1, 1			# length++
	b	get_str_len__loop_cond		# }

get_str_len__loop_end:

	move	$v0, $t1			# return length
	jr	$ra



	.data
string:
	.asciiz "it's week 3"