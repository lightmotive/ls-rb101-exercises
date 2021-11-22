# frozen_string_literal: true

def sum_squared(number)
  (1..number).sum**2
end

def squared_sum(number)
  (1..number).sum(&:abs2)
end

def sum_square_difference(number)
  sum_squared(number) - squared_sum(number)
end

p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1).zero?
p sum_square_difference(100) == 25_164_150
