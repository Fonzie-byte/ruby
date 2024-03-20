if ARGV.length < 1
	puts "Please provide a Ruby file's name, without the '.rb'-extension."
	exit
end

require "./#{ARGV[0]}"

# Todo: Roll weight-based
if ARGV.length >= 2
	word_length = ARGV[1].to_i
else
	word_length = $lengths.to_a.sample[0]
	word_length = rand(1..4) + rand(1..4) + rand(1..4)
end

# Todo: Roll weight-based
new_word = $letter_frequencies.to_a.sample[0]

while new_word.length < word_length do
	# Todo: Fetch, for safety
	# Todo: Roll weight-based
	last_two = new_word[-2..-1]

	if $letter_frequencies.fetch(last_two, "none") == "none"
		new_word = new_word + $letter_frequencies.to_a.sample[0]
	else
		possible_letters = $letter_frequencies.fetch(last_two, $letter_frequencies.to_a.sample[1])

		possible_letters.delete("count")
		new_word = new_word + possible_letters.to_a.sample[0]
	end
end

puts new_word[0...word_length]
