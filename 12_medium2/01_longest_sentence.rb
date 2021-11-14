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

require 'pp'

def words(string)
  string.scan(/\b\w+\b/m)
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

def paragraphs(string)
  regexp = case string
           when /\r\n/ then /(?:.+(?:[\r\n]{0,2}))+(?=[\r\n]{4,}|$)/
           else /(?:.+\n{0,1})+(?=\n{2,}|$)/
           end

  # regexp = /(?:.+\R{0,1})+(?=\R{2,}|$)/
  # That works with `\n`, but doesn't work with `\r\n`. Investigate later.

  string.scan(regexp).map(&:strip)
end

def longest_paragraph(string)
  paragraphs = paragraphs(string)

  longest_paragraph = paragraphs.max_by { |paragraph| words(paragraph).size }
  longest_paragraph_words = words(longest_paragraph)

  { paragraph: longest_paragraph,
    sentence_count: sentences(longest_paragraph).size,
    longest_sentence: longest_sentence(longest_paragraph),
    word_count: longest_paragraph_words.size,
    longest_word: longest_word(longest_paragraph_words) }
end

sample_text1 = File.read('01_longest_sentence.txt')

puts '* Longest Paragraph, Sample Text 1 *'
pp longest_paragraph(sample_text1)

puts "\n* Longest Sentence, Sample Text 1 *"
pp longest_sentence(sample_text1)

puts "\n* Longest Word, Sample Text 1 *"
pp longest_word(sample_text1)

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

sample_text2 = File.read('01_longest_sentence_pg84.txt')

puts "\n* Longest Paragraph, Sample Text 2 *"
pp longest_paragraph(sample_text2)

puts "\n* Longest Sentence, Sample Text 2 *"
pp longest_sentence(sample_text2)

puts "\n* Longest Word, Sample Text 2 *"
pp longest_word(sample_text2)
