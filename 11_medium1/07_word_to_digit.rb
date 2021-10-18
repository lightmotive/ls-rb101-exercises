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

def consolidate_digits(string)
  string.gsub(/\b(\d+[\s\d]*\d+)\b/) { |digits| digits.gsub(/\s/, '') }
end

p consolidate_digits('A 5   6  7 d') == 'A 567 d'
p consolidate_digits(' 31   6  72 ') == ' 31672 '

@mock_locale_library = {
  # A real-world locale library would be much more robust; there's probably a
  # Gem or other library to handle this.
  'en-US': {
    phone_number_pattern: /\b\d{10}\b/,
    phone_number_format: ->(string) { "(#{string[0..2]}) #{string[3..5]}-#{string[6..-1]}" }
  }
}

def format_phone_string(string, locale: 'en-US')
  @mock_locale_library[locale.to_sym][:phone_number_format].call(string)
end

def words_to_phone_number(string, locale: 'en-US')
  string = word_to_digit(string)
  string = consolidate_digits(string)

  # As with format_phone_string, one would need to provide a locale to select
  # the appropriate phone number pattern here:
  string.gsub(
    @mock_locale_library[locale.to_sym][:phone_number_pattern]
  ) { |phone_string| format_phone_string(phone_string, locale: locale) }
end

p words_to_phone_number(
  'Please call me at one one one five five five One two three FOUR. Thanks.'
) == 'Please call me at (111) 555-1234. Thanks.'
