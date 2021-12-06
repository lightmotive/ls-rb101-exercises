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

# array1 and array2 must be sorted.
def merge(array1, array2)
  return [] if array1.empty? && array2.empty?

  merged = []
  array_positions = [0, 0]

  loop do
    array1_pos_value = array_position_value(array1, array_positions[0])
    array2_pos_value = array_position_value(array2, array_positions[1])

    break merged if array1_pos_value == :end && array2_pos_value == :end

    if array1_pos_value == :end
      merged.push(array2[array_positions[1]])
      array_positions[1] += 1
    elsif array2_pos_value == :end
      merged.push(array1[array_positions[0]])
      array_positions[0] += 1
    elsif array1_pos_value <= array2_pos_value
      merged.push(array1[array_positions[0]])
      array_positions[0] += 1
    else
      merged.push(array2[array_positions[1]])
      array_positions[1] += 1
    end
  end
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
