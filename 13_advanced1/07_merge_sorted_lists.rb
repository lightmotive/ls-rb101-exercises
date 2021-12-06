# frozen_string_literal: true

# **PEDAC**

# *P*
# Input: Two sorted arrays.
# Output: One array that includes the elements of both arrays in sorted order.
#
# Rules:
# - Do not concatenate the arrays and then sort.
#
# Mental model: Combine the elements of each array so the elements are sorted
# at all times.

# *E*
# merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# merge([], [1, 4, 5]) == [1, 4, 5]
# merge([1, 4, 5], []) == [1, 4, 5]

# *D*
# Two input arrays and one new array to hold the sorted elements.

# *A*
# Given two sorted arrays called array1 and array2:
#
# - Initialize merged variable and assign to a new array.
# - Track the current comparison position of each array using variables named
#   array1_position and array2_position variables. Both start at 0.
# - While both position variables are less than the last index of their
#   associated arrays:
#   - Compare the elements at the current comparison position of each array.
#     -
#     - Add the smallest or first equal element to merged, incrementing the
#       position tracker for the associated array from which the element was
#       copied.
# - Return merged.

def array_position_value(array, position)
  return :end if position >= array.size

  array[position]
end

def array_position_values(arrays, positions)
  arrays.map.with_index do |array, index|
    array_position_value(array, positions[index])
  end
end

def merge_position!(merged, array, positions, position)
  merged.push(array[positions[position]])
  positions[position] += 1
end

def merge_compare!(arrays, positions, values, merged)
  if values[0] == :end
    merge_position!(merged, arrays[1], positions, 1)
  elsif values[1] == :end || values[0] <= values[1]
    merge_position!(merged, arrays[0], positions, 0)
  else
    merge_position!(merged, arrays[1], positions, 1)
  end
end

# Each array in *arrays must be sorted. Provide exactly 2 arrays.
def merge(*arrays)
  return [] if arrays[0].empty? && arrays[1].empty?

  merged = []
  positions = arrays.map { 0 }

  loop do
    values = array_position_values(arrays, positions)

    break merged if values[0] == :end && values[1] == :end

    merge_compare!(arrays, positions, values, merged)
  end
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
