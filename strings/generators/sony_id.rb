require "securerandom"

consonants = ["B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Z"]

id = [
  SecureRandom.rand(0..999).to_s.rjust(3, "0"),
  "",
  SecureRandom.rand(0..999).to_s.rjust(3, "0"),
  "",
]

3.times do
  id[1] += consonants[SecureRandom.rand(0..19)]
  id[3] += consonants[SecureRandom.rand(0..19)]
end

puts id.join("-")
