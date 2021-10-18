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
  'Please call me at five five five One two three FOUR. Thanks.'
) == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

def remove_consecutive_number_whitespace(string)
  string.gsub(/\b(\d+[\s\d]*\d+)\b/) { |digits| digits.gsub(/\s/, '') }
end

p remove_consecutive_number_whitespace('A 5   6  7 d') == 'A 567 d'

def format_phone_string(string, locale: 'en-US')
  # A real-world formatter would be much more robust--and there's probably a
  # Gem or other library to handle this.
  case locale
  when 'en-US' then "(#{string[0..2]}) #{string[3..5]}-#{string[6..-1]}"
  end
end

def words_to_phone_number(string)
  string = word_to_digit(string)
  string = remove_consecutive_number_whitespace(string)

  # As with format_phone_string, one would need to provide a locale to select
  # the appropriate phone number pattern here:
  string.gsub(/\d{9}/) { |phone_string| format_phone_string(phone_string) }
end

p words_to_phone_number(
  'Please call me at one one one five five five One two three FOUR. Thanks.'
) == 'Please call me at (111) 555-1234. Thanks.'
