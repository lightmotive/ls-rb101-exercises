# frozen_string_literal: true

def sum_of_sums(array)
  sum_total = 0
  accumulator = 0

  array.each do |number|
    accumulator += number
    sum_total += accumulator
  end

  sum_total

  # Another solution that I would expect to be less efficient computationally:
  # sum_total = 0
  # array.size.times do |idx|
  #   sum_total += array[0..idx].inject(:+)
  # end
  # sum_total
end

p sum_of_sums([3, 5, 2]) == 3 + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == 1 + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
