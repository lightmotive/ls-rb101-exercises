# frozen_string_literal: true

def penultimate_word(string)
  string.split[-2]
end

p penultimate_word('last word') == 'last'
p penultimate_word('Launch School is great!') == 'is'

# Further exploration:
puts 'Explore:'
# ***
# Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: strings
# that contain just one word, and strings that contain no words.
#
# Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered?
# How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase
# or sentence. It should handle all of the edge cases you thought of.
# ***
# OK, so first, some questions:
# - What if there is an even number of words? Do we take the middle word closer to the beginning or end?
#   - For the initial solution, I'll assume we take the middle word closer to the beginning.
#
# Assumptions:
# - If the string is empty or only white space, return an empty string.
# - If there is one word, return the word.

def middle_word(string)
  words = string.split
  size = words.size
  return '' if size.zero?
  return string if size == 1
  return words[size / 2] if size.odd?

  words[size / 2 - 1]
end

p middle_word('') == ''
p middle_word('   ') == ''
p middle_word('word') == 'word'
p middle_word('last word') == 'last'
p middle_word('Launch School is great!') == 'School'
p middle_word('Launch School is the best!') == 'is'
