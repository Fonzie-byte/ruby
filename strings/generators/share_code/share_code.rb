# Remember the consonants and numbers
$consonants = ['B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Z']
$numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

# Define a function to re-use
def generateGroup(is_number)
  # Which consists of three characters of the chosen type
  response = ""
  3.times do
    response += is_number ? $numbers.sample : $consonants.sample
  end

  # Regenerate if it's 666 as that might be seen as offensive
  if response == "666"
    return generateGroup
  end

  # If it's OK, return the generated characters
  return response
end

# Generate four groups
groups = []
4.times do |g|
  groups[g] = generateGroup([true, false].sample)
end

# Show them what we just made!
puts groups.join '-'
