# Markov Trigram Text Generator

This 'script' comes in two parts; a scanner and a generator.

## Pre-requisites

In order to use this, you need to have ruby installed *(`sudo apt install ruby`
on Debian- or Ubuntu-based Linux systems, `brew install ruby` on macOS with
Homebrew set up)* and a file containing enough text you want to generate similar
words of.

## Scanning a text-file

First you'll need a text-file with text similar to what you want to generate.
Then run:

```sh
ruby scanner.rb "$FILE"
```

Where `$FILE` is the name of your text-file. This outputs a results .rb-file
with two lines; one starting with `$word_lengths` and the other starting with
`$letter_frequencies`.

## Generating similar text

You can now run the following anytime you need a word like one in your original
text-file by running the following:

```sh
ruby generator.rb "$FILE"
```

Where `$FILE` is the name of the generated results .rb-file. This will output
one word like a word in your original text-file. It will likely be a new
'nonsense' word, but it might be one of the words from your text-file, as well.

## Errors

The generator may output a warning to `stderr` saying that re-rolling has
occured. This mean the quality of the output cannot be guaranteed. This may
happen often if your original text-file does not contain a lot of text. Try
scanning a much larger text if this happens often.
