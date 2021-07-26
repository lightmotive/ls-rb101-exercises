# frozen_string_literal: true

# Logic & pseudocode
# Remove all duplicate sequential characters from a string.

# Given a string
# SET last_char = nothing
# SET deduplicated_string = new mutable string
#
# FOR each character in string
#   IF character != last_char
#     deduplicated_string << character
#     last_char = character
#   ENDIF
# ENDFOR
#
# RETURN deduplicated_string

def crunch(string)
  last_char = nil
  deduplicated_string = String.new

  string.each_char do |char|
    if char != last_char
      deduplicated_string << char
      last_char = char
    end
  end

  deduplicated_string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
