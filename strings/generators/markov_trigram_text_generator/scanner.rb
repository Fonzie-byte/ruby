if ARGV.length < 1
  warn "Please provide a text file."
  exit
end

file_name = ARGV[0]
word_lengths = {}
letter_frequencies = {}

# Run lazy-loaded through the file
File.open(file_name).each do |line|
  # Grab all letters and apostrophes; e.g. all words
  line.downcase.scan(/[a-z]+/).each do |word|
    # Count how often words of this length showed up
    word_length = word.length
    word_lengths[word_length] = word_lengths.fetch(word_length, 0) + 1

    # Run through each letter, expect the last two as we're going through them by groups of three.
    (word_length - 2).times do |index|
      # Remember the current two letters and whatever letter follows after it.
      first_two = word[index] + word[index + 1]
      third = word[index + 2]

      letter_frequencies[first_two] = letter_frequencies
        .fetch(first_two, {"count" => 0})

      letter_frequencies[first_two]["count"] =
        letter_frequencies[first_two]["count"] + 1

      letter_frequencies[first_two][third] =
        letter_frequencies[first_two].fetch(third, 0) + 1

    end

    last_two = word[-2..-1]

    letter_frequencies[last_two] = letter_frequencies
      .fetch(last_two, {"count" => 0})

    letter_frequencies[last_two]["count"] =
      letter_frequencies[last_two]["count"] + 1
  end
end

File.open(file_name + "_results_" + Time.now.to_i.to_s + ".rb", 'w') do |file|
  file.write("$word_lengths = " + word_lengths.to_s + "\n")
  file.write("$letter_frequencies = " + letter_frequencies.to_s + "\n")
end
