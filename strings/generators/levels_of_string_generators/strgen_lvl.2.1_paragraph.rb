vowels = ['a', 'e', 'i', 'o', 'u', 'y']
consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z']

paragraph = []
paragraph_length = rand(1..3) + rand(1..3)

paragraph_length.times do
	sentence = []
	sentence_length = rand(1..3) + rand(1..3) + rand(1..3)

	sentence_length.times do
		word = ""
		2.times do
			word << ([true, false].sample ? vowels.sample : consonants.sample)
		end

		extra_characters = rand(1..3) + rand(1..3) + rand(1..3) - 2

		extra_characters.times do |i|
			first_is_vowel = vowels.include? word[i]
			second_is_vowel = vowels.include? word[i + 1]

			if first_is_vowel && second_is_vowel
				word << consonants.sample
			elsif !first_is_vowel && !second_is_vowel
				word << vowels.sample
			else
				word << ([true, false].sample ? vowels.sample : consonants.sample)
			end
		end

		sentence.push(word)
	end

	paragraph.push(sentence.join(' ').capitalize)
end

puts paragraph.join(".\n") + '.'
