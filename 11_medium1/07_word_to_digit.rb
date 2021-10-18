# frozen_string_literal: true

# Basic algorithm:
# - Loop through string words.
#   - If word is a number and next word is a number, start converting
#     subsequent number words to numbers until non-number words appear.

DIGIT_WORDS = %w[zero one two three four five six seven eight nine].freeze

def word_to_digit(string)
  DIGIT_WORDS.each do |digit_word|
    string = string.gsub(
      /\b#{digit_word}\b/i,
      DIGIT_WORDS.index(digit_word).to_s
    )
  end

  string
end

p word_to_digit(
  'Please call me at five five five one two three four. Thanks.'
) == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
