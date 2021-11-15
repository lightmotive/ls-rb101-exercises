# frozen_string_literal: true

# Basic logic
# - Determine the percentage three sets of characters:
#   - Lowercase
#   - Uppercase
#   - Other ("neither")
# - Count the total chars.
# - Use String#count with character ranges to count character sets.
#   - Divide those counts by total chars to get percentage, then multiply
#     by 100 to get ratio.

def ratio(count, total)
  (count / total.to_f) * 100
end

def letter_percentages(string)
  total = string.size
  { lowercase: ratio(string.count('a-z'), total),
    uppercase: ratio(string.count('A-Z'), total),
    neither: ratio(string.count('^A-Za-z'), total) }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
