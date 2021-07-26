# frozen_string_literal: true

# * Logic & pseudocode (updated to count only letter characters in words) *
# Split the sentence into words (space-separated blocks of text), iterate through words, and add the count of all A-Z
# and a-z characters to a hash organized by count value.

# Given a string
#
# SET words = string split by space
# SET length_count = new hash object with a key default value of 0
#
# FOR each word
#   SET length = word length (characters only)
#   length_count[length] = length_count[length] + 1
# ENDFOR

# RETURN length_count

def word_sizes(string)
  length_count = Hash.new(0)

  string.split.each { |word| length_count[word.count('A-Za-z')] += 1 }

  length_count
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
