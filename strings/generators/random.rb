length = ARGV[0] ? ARGV[0].to_i : 16
alphabet = ARGV[1] ? ARGV[1].chars : nil

# If no alphabet
if alphabet == nil
  # Fully random, any printable ASCII character
  random_string = (0...length).map { rand(32...127).chr }.join
  puts random_string
else
  # With a given alphabet
  random_string = (0...length).map { alphabet.sample }.join
  puts random_string
end
