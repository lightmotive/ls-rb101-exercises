# frozen_string_literal: true

def negative(number)
  -number.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0).zero?      # There's no such thing as -0 in ruby
