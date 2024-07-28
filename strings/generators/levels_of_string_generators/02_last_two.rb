# Globals
VOWELS = %w[a e i o u y]
CONSONANTS = [*'b'..'z'] - VOWELS

# Functions
def next_letter(string = "")
  if string.length < 2
    return ([true, false].sample ? VOWELS : CONSONANTS).sample
  end

  # This looks like it works but produces mixed results
#  last_two = string[-2..-1]
#  p last_two
#  p *VOWELS
#  p *CONSONANTS
#  case last_two
#  when *VOWELS
#    puts "Both vowels"
#    return CONSONANTS.sample
#  when *CONSONANTS
#    puts "Both cons"
#    return VOWELS.sample
#  else
#    puts "Mixed"
#    return ([true, false].sample ? VOWELS : CONSONANTS).sample
#  end

  # "This looks like it works but produces mixed results" pt.2: Electric Boogaloo
#  last_two = string[-2..-1].chars
#  p last_two
#  if last_two.all? { |char| VOWELS.include?(char) }
#    puts "Both vowels"
#    return CONSONANTS.sample
#  elsif last_two.all? { |char| CONSONANTS.include?(char) }
#    puts "Both cons"
#    return VOWELS.sample
#  else
#    puts "Mixed!"
#    return ([true, false].sample ? VOWELS : CONSONANTS).sample
#  end

  # This kiddy mess is the only stuff I got consistently correct results with...
  first_is_vowel = VOWELS.include?(string[-2])
  second_is_vowel = VOWELS.include?(string[-1])

  if first_is_vowel and second_is_vowel
    CONSONANTS.sample
  elsif !first_is_vowel and !second_is_vowel
    VOWELS.sample
  else
    ([true, false].sample ? VOWELS : CONSONANTS).sample
  end
end

def prostr(length = 0)
  string = next_letter

  length -= 1
  length.times do
    string << next_letter(string)
  end

  string
end

# Variables
length = ARGV.length >= 1 ? ARGV[0].to_i : rand(1..3) + rand(1..3) + rand(1..3)

# Starting point
puts prostr(length)
