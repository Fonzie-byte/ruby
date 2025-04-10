require 'securerandom'

# Playing card 2..10
amount = SecureRandom.rand(2..10)

# Monster type, leaving Dragons for special occassions (d6)
type = case SecureRandom.rand(1..6)
       when 1
         "animals"
       when 2
         "brutes"
       when 3
         "constructs"
       when 4
         "monsters"
       when 5
         "people"
       else
         "undead"
       end

# Monster challenge rating (1d6+1, re-roll 2)
challenge = SecureRandom.rand(3..7)

puts "#{amount} #{type} of challenge rating #{challenge}"
