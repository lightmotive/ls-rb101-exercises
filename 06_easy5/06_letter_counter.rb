# frozen_string_literal: true

# * Logic & pseudocode *
# Split the sentence into words (words defined specifically as any block of characters without a space),
# iterate through words, evaluate the length, and add a count of each length to a hash.
# There's no need to use RegEx because the definition of "word" is simplified.

# Given a string
#
# SET words = string split by space
# SET length_count = new hash object with a key default value of 0
#
# FOR each word
#   SET length = word length
#   length_count[length] = length_count[length] + 1
# ENDFOR

# RETURN length_count

def word_sizes(string)
  length_count = Hash.new(0)

  string.split.each { |word| length_count[word.length] += 1 }

  length_count
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
