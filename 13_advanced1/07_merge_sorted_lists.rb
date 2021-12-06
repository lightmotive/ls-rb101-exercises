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
#     - Add the smallest or first equal element to merged, incrementing the
#       position tracker for the associated array from which the element was
#       copied.
# - Return merged.

def array_position_value(array, position)
  return :end if position >= array.size

  array[position]
end

# Argument arrays must be sorted.
def merge_one_pass(array1, array2)
  return [] if array1.empty? && array2.empty?

  merged = []
  array1_idx = 0
  array2_idx = 0

  loop do
    array1_pos_value = array_position_value(array1, array1_idx)
    array2_pos_value = array_position_value(array2, array2_idx)

    break merged if array1_pos_value == :end && array2_pos_value == :end

    if array1_pos_value == :end
      merged.push(array2[array2_idx])
      array2_idx += 1
    elsif array2_pos_value == :end
      merged.push(array1[array1_idx])
      array1_idx += 1
    elsif array1_pos_value <= array2_pos_value
      merged.push(array1[array1_idx])
      array1_idx += 1
    else
      merged.push(array2[array2_idx])
      array2_idx += 1
    end
  end
end

# *A*
# - Track the current position in array2 with index2.
# - Initialize result and assign to a new array.
# - Loop through each value in array1:
#   - Loop through array2 while index2 < array2.size and the array2 value at
#     that index is <= the current array1 value.
#     - Append the value at array2[index2] to result.
#   - Append the current array1 value to result.
# - Concatenate any values remaining in array2 that are larger than the last
#   array1 value, and return that result.
def merge_multiple_passes(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

require_relative '../../ruby-common/test'
require_relative '../../ruby-common/benchmark_report'

# def sorted_big_array_create(element_count)
#   (1..element_count).map { rand(element_count) }.sort
# end

# big_array1 = sorted_big_array_create(3000)
# big_array2 = sorted_big_array_create(3000)

TESTS = [
  { input: [[1, 5, 9], [2, 6, 8]],
    expected_output: [1, 2, 5, 6, 8, 9] },
  { input: [[1, 1, 3], [2, 2]],
    expected_output: [1, 1, 2, 2, 3] },
  { input: [[], [1, 4, 5]],
    expected_output: [1, 4, 5] },
  { input: [[1, 4, 5], []],
    expected_output: [1, 4, 5] }
  # , { input: [big_array1, big_array2],
  #   expected_output: merge_multiple_passes(big_array1, big_array2) }
].freeze

run_tests('merge_one_pass', TESTS, ->(input) { merge_one_pass(*input) })
run_tests('merge_multiple_passes', TESTS,
          ->(input) { merge_multiple_passes(*input) })

benchmark_report(
  2, 200, TESTS,
  [
    { label: 'one_pass',
      method: ->(input) { merge_one_pass(*input) } },
    { label: 'multiple_passes',
      method: ->(input) { merge_multiple_passes(*input) } }
  ]
)

# Launch School's "multiple_passes" solution is over 15x faster than the
# "one_pass" solution (1.7x faster with simplified version restored).

# Let's dive deeper...

# The Launch School solution that seems like multiple passes is actually only
# one pass through each array, and it inherently handles cases where one array
# or the other is empty thanks to the `while` expression with `index2` position
# tracker.

# It might seem like "one_pass" would be faster because it's comparing each
# value exactly once, whereas "multiple_passes" compares values multiple times.
# However, "one_pass" is seeking to a specific index for both arrays and
# has to evaluate a multi-branch `if` statement each time.

# "multiple_passes", on the other hand, iterates through array1, then only
# seeks to specific positions for the second array. It also doesn't have the
# overhead of tracking multiple indices in an array.
# "multiple_passes" is also much simpler.
