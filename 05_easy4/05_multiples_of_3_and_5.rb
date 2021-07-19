# frozen_string_literal: true

def multiple?(number, divisor)
  (number % divisor).zero?
end

def multisum(max_integer)
  sum = 0

  1.upto(max_integer) do |current_integer|
    sum += current_integer if multiple?(current_integer, 3) || multiple?(current_integer, 5)
  end

  sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(20) == 98
p multisum(1000) == 234_168
