# frozen_string_literal: true

# PEDAC
# =====
#
# * P *
# Input: text file content
# Outputs:
#   - String containing the longest sentence based on the number of words.
#   - Number of words in that sentence.
#
# Rules:
# - Sentence delimiter is %w[. ! ?]
# - Word delimiter: spaces
#   - Word excludes sentence delimiters
#
# Questions:
# - What if there are multiple sentences with the longest word count?
#   - For this exercise, take the last longest sentence.
#
# * E *
# - Load 01_longest_sentence.txt:
#   - Print the last sentence.
#   - Word count: 86
# - Load http://www.gutenberg.org/cache/epub/84/pg84.txt
#   - Longest sentence is ...
#   - Word count: 157
#
# * D *
# - sentences = Array (split the content by sentence delimiter)
#   - words (within each sentence) = Array (split sentence string)
#
# * A *
# words(string)
# ------------------
# - Split string by space.
# - Return array of words.

# sentences(string)
# -----------------
# - Use Regexp to split content string into sentences.
# - Return array of sentences.

# longest_sentence(string)
# ------------------------
# - Get sentences(string)
# - Loop through each sentence
#   - Get words in sentence (`words` method) and save count and sentence
#     to variables: longest_sentence_word_count and longest_sentence
#     - If current word count is greater than longest_sentence_word_count, update those
#       variables.
# - Return Hash with sentence and word_count keys.

def words(string)
  string.scan(/[\w-]+/m)
end

def longest_word(words)
  return words.max_by(&:size) if words.is_a?(Array)
  return longest_word(words(words)) if words.is_a?(String)

  nil
end

def sentences(string)
  string.scan(/[^?.!]*[?.!]+/m).map(&:strip)
end

def longest_sentence(string)
  sentences = sentences(string)

  longest_sentence = sentences.max_by { |sentence| words(sentence).size }
  longest_sentence_words = words(longest_sentence)

  { sentence: longest_sentence,
    word_count: longest_sentence_words.size,
    longest_word: longest_word(longest_sentence_words) }
end

p longest_sentence(File.read('01_longest_sentence.txt'))
p longest_word(File.read('01_longest_sentence.txt'))

# require 'net/http'
# def web_content(url)
#   uri = URI(url)
#   Net::HTTP.get_response(uri)
# end

# p longest_sentence(
#   web_content('http://www.gutenberg.org/cache/epub/84/pg84.txt')
# )
# It appears the site is now redirecting requests, possibly due to
# Launch School student overuse!
#   Response: #<Net::HTTPFound 302 Found readbody=true>
#
# Therefore, we'll download and load it from a local file as with the first
# example.

p longest_sentence(File.read('01_longest_sentence_pg84.txt'))
p longest_word(File.read('01_longest_sentence_pg84.txt'))
