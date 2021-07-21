# frozen_string_literal: true

# Pseudocode
# Simplified: Loop through the characters of a string and sum the ASCII value of each.
# ***
# Given a string
#
# SET string_value to 0
#
# FOR each character in string
#   SET char_value to the ASCII ordinal value for that character
#   string_value = string_value + char_value
# ENDFOR
#
# RETURN string_value

def ascii_value(string)
  string.chars.reduce(0) { |string_value, char| string_value + char.ord }
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further exploration: convert an integer to a character with optional encoding specification
# Integer#chr([encoding])
p(('a'.ord.chr == 'a') == true)
p 'ab'.ord.chr # It's good to know that String#ord will only use the first character of multi-char string.
