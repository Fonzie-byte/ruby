=begin
  Call this script with a single integer (0 or more) for the amount of dice you
  roll.
  You can also add a second argument, an "a" or "d", to make the roll
  advantaged (+1) or disadvantaged (-1).
=end

# We require the amount of dice to be 0 or a positive integer.
dice = ARGV[0].to_i
if dice < 0
  puts "Please add the number of dice you roll. Input 0 for \"1d6 disadvantaged\""
  exit
end

# Advantage adds 1 if "a" was passed, -1 if "d" was passed, 0 in other cases.
advantage = ARGV[1] == 'a' ? 1 : ARGV[1] == 'd' ? -1 : 0

# Keep track of the outcomes of the rolls, and the amount of ones rolled.
outcomes = Array.new
ones = 0

# For each die...
dice.times do
  # Roll 1..6
  result = rand(1..6)
  # Add it to the list of outcomes...
  outcomes.push(result)

  # And add the amount of ones if it is one.
  if result === 1
    ones += 1
  end
end

# If there were no dice (0 in a skill)
if dice === 0
  # Always roll with disadvantage
  advantage = -1
  # Yep, roll and add it.
  outcomes.push(rand(1..6))
end

# Tell them their highest roll, add the (dis)advantage to the end-result.
puts "You rolled #{outcomes.max + advantage}."

# If they rolled 2d6 or more...
if dice > 1
  # And there were ones; tell them this!
  if ones === 1
    puts "You also rolled a 1!"
  elsif ones > 1
    puts "You also rolled #{ones}× 1's!"
  end
end
