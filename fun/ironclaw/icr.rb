=begin
  This script takes a numeric string as input, rolls your dice and tells you
  your results, sorted from high-to-low to make it easier to read them.

  If you want a more friendly display, with a target number, try running
  ironclaw/roller.rb instead.
=end

if ARGV[0] == nil
  puts "Please provide your dice."
  puts "46802 for d4's, d6's, d8's, d10's and d12's respectively."
  exit
end

system_text = " -- rolling "

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

puts system_text[0...-2] + " -- "
puts

p dice.sort.reverse

if dice.max == 1
  puts "BOTCH!"
end
