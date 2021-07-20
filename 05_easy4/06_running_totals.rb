# frozen_string_literal: true

def running_total(array)
  sum = 0
  array.map { |number| sum += number }

  # Alternative solution (less elegant than map, but good to know about Enumerable#each_with_object):
  # array.each_with_object([]) { |number, sum_array| sum_array << (sum_array.empty? ? 0 : sum_array.last) + number }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
