# frozen_string_literal: true

DIGITS =
  { '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    'a' => 10,
    'b' => 11,
    'c' => 12,
    'd' => 13,
    'e' => 14,
    'f' => 15 }.freeze

def string_to_integer(string, base = 10)
  number = 0
  string.downcase.chars.each do |char|
    number = (number * base) + DIGITS[char]
  end
  number
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('4D9f', 16) == 19_871
