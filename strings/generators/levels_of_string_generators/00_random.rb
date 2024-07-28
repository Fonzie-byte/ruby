# The string will be 6 characters
6.times do
	# Pick and show a random character between 'a' and 'z'
	print rand(97..122).chr
end

# For the terminal's sake, let's end with a newline
puts
