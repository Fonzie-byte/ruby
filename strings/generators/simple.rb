vowels = ["a", "e", "i", "o", "u", "y"]
consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]

length = (ARGV[0] || "8").to_i

genstr = ''
isVowel = false

length.times do
	genstr += isVowel ? vowels.sample : consonants.sample
	isVowel = !isVowel
end

puts genstr
