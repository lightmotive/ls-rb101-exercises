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
  string.split
end

def sentences(string)
  delimiters = %w[? . !]
  regexp_symbols = delimiters.map { |delimiter| "\\#{delimiter}\s" }
  regexp_symbols.concat(delimiters.map { |delimiter| "\\#{delimiter}" })
  string.split(/#{regexp_symbols.join("|")}/)
end

def longest_sentence(string)
  sentences = sentences(string)

  longest_sentence = { sentence: nil, word_count: nil }

  sentences.each do |sentence|
    word_count = words(sentence).size
    next unless longest_sentence[:word_count].nil? ||
                word_count >= longest_sentence[:word_count]

    longest_sentence[:sentence] = sentence
    longest_sentence[:word_count] = word_count
  end

  longest_sentence
end

p longest_sentence(File.read('01_longest_sentence.txt'))

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
