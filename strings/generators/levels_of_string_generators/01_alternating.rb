# Globals
VOWELS = %w[a e i o u y]
CONSONANTS = [*'b'..'z'] - VOWELS

# Functions
def prostr(length = 0)
  # Start with a vowel or consonant at random
  is_vowel = [true, false].sample

  # For as long as the string needs to be...
  length.times.map do
    # Alternate between vowels and consonants
    is_vowel = !is_vowel
    # Returning a random entry from the correct constant
    (is_vowel ? VOWELS : CONSONANTS).sample
  end.join
end

# Variables
length = ARGV.length >= 1 ? ARGV[0].to_i : rand(1..3) + rand(1..3) + rand(1..3)

# Execute and print to the command-line
puts prostr(length)
