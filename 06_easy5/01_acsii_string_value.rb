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
