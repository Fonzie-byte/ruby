# Remember the vowels and consonants
vowels = ['a', 'e', 'i', 'o', 'u']
consonants = ['c', 'h', 'j', 'k', 'l', 'm', 'p', 'r', 's', 't']

# Listen to terminal input for word length
syllable_count = ARGV[0].to_i

# If invalid, generate a sensible length
if syllable_count < 1 || syllable_count > 4
	# 2/7 chance on one-syllable words
	# 2/7 chance on two-syllable words
	# 2/7 chance on three-syllable words
	# 1/7 chance on four-syllable words
	syllable_count = (rand(1..7) / 2.0).ceil
end

# Pick and show that many consonant+vowel pairs
syllable_count.times do
	print consonants.sample + vowels.sample
end

# For the terminal's sake, let's end with a newline
puts
