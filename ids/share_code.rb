$digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
$consonants = ['B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Z']

# Generated a group of either consonants or digits.
def generateGroup is_digits
	group = ""
	3.times do
		group += is_digits ? $digits.sample : $consonants.sample
	end

	# Keep regenerating as long as it contains a banned combination.
	if group === "666"
		return generateGroup is_digits
	end

	# Return what was generated if there were no wrong values.
	return group
end

generated_code = []

# Generate four groups.
4.times do |g|
	is_digits = [true, false].sample
	generated_code[g] = generateGroup is_digits
end

# Print them with dashes in between.
puts generated_code.join '-'