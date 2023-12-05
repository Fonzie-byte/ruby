=begin
  This script takes a numeric string as input, optionally a second number as
  target number, rolls your input, compares it to the target number, and lets
  you know how humans would play this result out.

  If you don't know the target number, and need to know all your rolls, try
  running icr.rb instead.
=end

# We require the dice string.
if ARGV[0] == nil
  puts "Please provide your dice."
  puts "46802 for d4's, d6's, d8's, d10's and d12's respectively."
  exit
end

system_text = " -- rolling "

# Roll dice
dice = Array.new
ARGV[0].chars.each do |die|
  die = die.to_i

  case die

  when 4, 6, 8
    system_text << "d#{die}, "
    dice.push(rand(1..die))
  when 0, 2
    system_text << "d1#{die}, "
    dice.push(rand(1..10+die))
  else
    puts "Please only provide 4, 6, 8, 0 and/or 2 for your dice, no spaces."
    puts 'For example: 886 for "2d8, d6".'
    exit
  end

end

# Derive target number, take 3 if not given.
# target = (ARGV[1] || "3").to_i
target = ARGV[1] ? ARGV[1].to_i : 3

# Target number should never be lower than 2 or higher than 11.
# target = [[target, 2].max, 11].min
target = target.clamp(2..11)

# Print vs.target, without the trailing comma and space from the die notation.
puts system_text[0...-2] + " vs.#{target} -- "
puts

# Highest roll only...
roll = dice.max

# If even the highest roll is a 1, they're all 1's.
if roll == 1
  puts "Player: Aww shucks! I botched!"
  exit
end

puts "Player: I rolled #{roll}"

if roll <= target
  puts "Host: Too bad."
else
  puts "Host: Nice! How many above #{target}?"

  successes = 0
  dice.each do |die|
    if die > target
      successes += 1
    end
  end

  puts "Player: Err, #{successes}"
end
