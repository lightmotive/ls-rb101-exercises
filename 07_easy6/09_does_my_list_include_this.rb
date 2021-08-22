# frozen_string_literal: true

def include?(array, find)
  !!array.find_index(find)
end

p include?([1, 2, 3, 4, 5], 3) == true
p include?([1, 2, 3, 4, 5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([1, 8, nil, 11], nil) == true
p include?([], nil) == false
