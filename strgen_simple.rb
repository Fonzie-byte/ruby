vowels = ["a", "e", "i", "o", "u", "y"]
consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]

length = (ARGV[0] || '8').to_i
string = ''
curvow = false

length.times do
  string += curvow ? vowels.sample : consonants.sample
  curvow = !curvow
end

puts string
