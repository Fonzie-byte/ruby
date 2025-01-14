# Remember the consonants and numbers
consonants = ['B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Z']
numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

# Start with three consonants
3.times do
  print consonants.sample
end

# Separate using a dash
print '-'

# End with four numbers
4.times do
  print numbers.sample
end

# For the terminal's sake, let's end with a newline
puts
