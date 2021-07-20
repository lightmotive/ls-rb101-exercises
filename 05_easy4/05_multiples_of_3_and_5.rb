# frozen_string_literal: true

def multiple?(number, divisor)
  (number % divisor).zero?
end

def multisum(max_integer)
  1.upto(max_integer).select { |int| multiple?(int, 3) || multiple?(int, 5) }.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(20) == 98
p multisum(1000) == 234_168
