# Remember the vowels and consonants
vowels = ['a', 'e', 'i', 'o', 'u', 'y']
consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z']

# Randomly start with either a vowel or a consonant
is_vowel = [true, false].sample

# Randomly pick the string to be between 3 and 8 characters long (inc both)
string_length = rand(3..8)

# For as long as needed...
string_length.times do
	# ...pick a vowel or a consonant, whichever's turn it is...
	print is_vowel ? vowels.sample : consonants.sample
	# ...and keep alternating
	is_vowel = !is_vowel
end

# For the terminal's sake, let's end with a newline
puts
