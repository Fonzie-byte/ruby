require 'securerandom'

=begin
  Call this script with a single integer (0 or more) for the amount of dice you
  roll.
  You can also add a second argument, an "a" or "d", to make the roll
  advantaged (+1) or disadvantaged (-1).
=end

# We require the amount of dice to be 0 or a positive integer.
skill_level = ARGV[0].to_i
if skill_level < 0
  puts "Please add the number of dice you roll. Input 0 for \"1d6 disadvantaged\""
  exit
end

# No points in skill? 1dd
if skill_level === 0
  puts "You rolled #{SecureRandom.rand(1..6) -1}"
  exit
end

# Advantage adds 1 if "a" was passed, -1 if "d" was passed, 0 in other cases.
advantage = ARGV[1] == 'a' ? 1 : ARGV[1] == 'd' ? -1 : 0

# Keep track of the outcomes of the rolls, and the amount of ones rolled.
outcomes = Array.new
ones = 0

# For each die...
skill_level.times do
  # Roll 1..6
  result = SecureRandom.rand(1..6)
  # Add it to the list of outcomes...
  outcomes.push(result)

  # And add the amount of ones if it is one.
  if result === 1
    ones += 1
  end
end

# Tell them their highest roll, add the (dis)advantage to the end-result.
puts "You rolled #{outcomes.max + advantage}."

# If they rolled 2d6 or more...
if skill_level > 1
  # And there were ones; tell them this!
  if ones === 1
    puts "You also rolled a 1!"
  elsif ones > 1
    puts "You also rolled #{ones}× 1's!"
  end
end
