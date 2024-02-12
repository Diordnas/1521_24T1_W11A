# You should have more comments than I do in this file
# Ideally, nearly every line should have a comment next to it! :D

main:
	# x in $t0

	li	$v0, 4
	la	$a0, prompt_string
	syscall

	li	$v0, 5
	syscall
	move	$t0, $v0

	ble	$t0, 100, print_small_big
	bge	$t0, 1000, print_small_big

print_medium:
	li	$v0, 4
	la	$a0, medium_string
	syscall

	b	end

print_small_big:
	li	$v0, 4
	la	$a0, small_big_string
	syscall


end:
	li	$v0, 0
	jr	$ra

	.data
prompt_string:
	.asciiz"Enter a number: "
medium_string:
	.asciiz"medium\n"
small_big_string:
	.asciiz"small/big\n"