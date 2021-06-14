# frozen_string_literal: true

def is_odd?(number)
  number % 2 == 1
  # Alternative using Integer#remainder:
  # number.remainder(2) != 0
end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
