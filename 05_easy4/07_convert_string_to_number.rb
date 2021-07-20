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
    '9' => 9 }.freeze

def string_to_integer(string)
  number = 0
  string.chars.each do |char|
    number = (number * 10) + DIGITS[char]
  end
  number
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
