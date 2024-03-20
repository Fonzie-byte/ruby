$consonants = ["B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Z"]
$numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

def generateGroup(is_number)
	response = ""
	3.times do
		response += is_number ? $numbers.sample : $consonants.sample
	end

	if response == "666"
		return generateGroup
	end

	return response
end

groups = []
4.times do |g|
	groups[g] = ""
	is_number = [true, false].sample
	groups[g] = generateGroup is_number
end

puts groups.join "-"
