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

def string_to_integer_abs(string)
  sign_multiplier = 1
  string_abs = String.new(string)
  prefix = string[0]

  if %w[- +].include?(prefix)
    sign_multiplier = -1 if prefix == '-'
    string_abs = string[1..-1]
  end

  [string_abs, sign_multiplier]
end

def string_to_integer(string, base = 10)
  number = 0

  string_abs, sign_multiplier = string_to_integer_abs(string)

  string_abs.downcase.chars.each do |char|
    number = (number * base) + DIGITS[char]
  end

  number * sign_multiplier
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('4D9f', 16) == 19_871
p string_to_integer('-570') == -570
p string_to_integer('+100') == 100
