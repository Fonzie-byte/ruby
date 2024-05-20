# Remember the vowels and consonants
vowels = ['a', 'e', 'i', 'o', 'u', 'y']
consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z']

# Get us started with two letters, 50/50 between vowels and consonants
string = ""
2.times do
	string << ([true, false].sample ? vowels.sample : consonants.sample)
end

# The word should be 3..9 characters long, with a sort of bell curve
# -2 as we already have two characters up above
extra_characters = rand(1..3) + rand(1..3) + rand(1..3) - 2

# For as long as needed
extra_characters.times do |i|
	# Check wether the last two are vowels or consonants
	first_is_vowel = vowels.include? string[i]
	second_is_vowel = vowels.include? string[i + 1]

	# If both are vowels...
	if first_is_vowel && second_is_vowel
		# ...then the next one must be a consonant
		string << consonants.sample
	# If both are consonants...
	elsif !first_is_vowel && !second_is_vowel
		# ...then the next one must be a vowel
		string << vowels.sample
	else
		# Otherwise, pick any character, 50/50 between vowels and consonants
		string << ([true, false].sample ? vowels.sample : consonants.sample)
	end
end

# For the terminal's sake, let's end with a newline
puts string
