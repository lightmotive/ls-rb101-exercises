# frozen_string_literal: true

def short_long_short(string1, string2)
  outer_word = string1
  inner_word = string2
  if string1.length > string2.length
    outer_word = string2
    inner_word = string1
  end

  "#{outer_word}#{inner_word}#{outer_word}"
end
# That method separates the word selection logic from formatting for better clarity.

p short_long_short('abc', 'defgh') == 'abcdefghabc'
p short_long_short('abcde', 'fgh') == 'fghabcdefgh'
p short_long_short('', 'xyz') == 'xyz'
