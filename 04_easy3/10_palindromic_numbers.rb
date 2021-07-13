# frozen_string_literal: true

def palindrome?(implements_reverse)
  implements_reverse == implements_reverse.reverse
end

def palindromic_number?(integer)
  palindrome?(integer.to_s)

  # Alternative approach without string conversion:
  # palindrome?(integer.digits)
end

p palindromic_number?(34_543) == true
p palindromic_number?(123_210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
