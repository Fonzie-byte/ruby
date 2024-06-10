if ARGV.length < 1
  warn "Please provide a Ruby file's name, without the '.rb'-extension."
  exit
end

require "./#{ARGV[0]}"

def weighted_random_length
  # Roll randomly on total weight of word lengths
  total_weight = $lengths.values.sum
  target = rand * total_weight

  # Pass over each frequency, until >= target number
  cumulative_weight = 0
  $lengths.each do |length, weight|
    cumulative_weight += weight
    return length if target < cumulative_weight
  end
end

def weighted_two_letter
  # Roll randomly on total weight of letter frequencies
  total_count = $letter_frequencies.values.sum { |freq| freq["count"] }
  target = rand * total_count

  # Pass over each frequency, until >= target number
  cumulative_count = 0
  $letter_frequencies.each do |combination, freq|
    cumulative_count += freq["count"]
    return combination if target < cumulative_count
  end
end

def weighted_next_letter(last_two)
  # If last two aren't a known combination, just pass a new two-letter comb.
  return weighted_two_letter unless $letter_frequencies.has_key?(last_two)

  # Duplicate string of allowed next characters (cos frozen) and remove the
  # already-used count, and roll on the leftover weight of just the letters
  possible_next = $letter_frequencies[last_two].dup
  possible_next.delete("count")
  total_weight = possible_next.values.sum

  # The last two-letter combination does not follow up, so some entries might
  # not have a follow-up letter. Account for this.
  return weighted_two_letter if possible_next.empty?

  target = rand * total_weight

  # Pass over each frequency until, until >= target number
  cumulative_weight = 0
  possible_next.each do |letter, weight|
    cumulative_weight += weight
    return letter if target < cumulative_weight
  end
end

def generate_word(desired_length)
  # Grab two letters to start with (dup cos "frozen")
  new_word = weighted_two_letter.dup

  rerolled = false

  # Keep going until new word is long enough
  while new_word.length < desired_length
    # Look at the last two letters
    last_two = new_word[-2..-1]

    # Grab a valid next letter
    next_letter = weighted_next_letter(last_two)

    # If is are more than one letter, we had to re-roll.
    # Remember this to warn the user later
    rerolled = true if next_letter.length > 1

    # Add whatever it was to the new word
    new_word << next_letter
  end

  # Warn user if re-rolling occured
  warn "Warning: Re-rolling occured, word may not be accurate!" if rerolled
  # Return new word, either way
  # Limit to desired length in case re-rolling occured at the end
  new_word[0..desired_length]
end

# Take the second argument as length if present, or roll on lengths-hash.
if ARGV.length >= 2
  word_length = ARGV[1].to_i
else
  word_length = weighted_random_length
end

# To demo, show them their new word!
puts generate_word(word_length)
