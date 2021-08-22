# frozen_string_literal: true

def halvsies(array)
  size = array.size
  middle = (size / 2.0).ceil
  first_half = array[0, middle]
  second_half = array[middle, size - middle]
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
