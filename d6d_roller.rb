# First argument, intepreted as number, is skill level.
skill_level = ARGV[0].to_i
# If second argument is "a", +1. If it's "d", -1. All other cases 0.
advantage = ARGV[1] === "a" ? 1 : ARGV[1] === "d" ? -1 : 0

# No points in skill? 1dd
if skill_level === 0
  puts "You rolled #{rand(1..6) -1}"
  exit
end

# Levels in skill? Roll!
results = Array.new
ones = 0
skill_level.times do
  roll = rand(1..6)
  results.push(roll)

  if roll === 1
  	ones += 1
  end
end

# Tell it, calculate the advantage.
puts "You rolled #{results.max + advantage}"

# If rolled multiple skills, show them the amount of ones they rolled.
if skill_level > 1 && ones > 0
  puts "You also roleld #{ones} ones!"
end
