# For 6 stats
stats = Array.new
6.times do
  # Roll 4 dice
  dice = Array.new
  4.times do
    # Roll a d6 and add it
    dice.push rand(1..6)
  end
  # Remove the lowest die
  dice.sort!.shift

  # Add the total sum to the current stat
  stats.push(dice.sum)
end

# Show them the stats, from high-to-low
puts stats.sort.reverse
