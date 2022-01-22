# frozen_string_literal: true

# **PEDAC for merging two sorted arrays**
# (This is practice to ensure I retained the learnings from the last exercise.)
# *P*
# Input: Two sorted arrays
# Output: One array containing the elements from both arrays, sorted.
#
# *E*
# merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# merge([], [1, 4, 5]) == [1, 4, 5]
# merge([1, 4, 5], []) == [1, 4, 5]
#
# *D*
# - Build a new array containing the elements in sorted order.
# - Track the second array's current position in a variable.
#
# *A*
# Procedure: merge
# Given two arrays, array1 and array2:
#
# - Initialize `merged` and assign to a new array.
# - Initialize tracking variable for second array as `index2` and assign to 0.
# - Iterate through each element in `array1` as `element1`
#   - While `index2` hasn't reached the end AND
#     `array2[index2]`` is <= `element1`:
#     - Append `array2[index2]` to `merged`.
#     - Increment `index2`.
#   - Append `element1` to `merged`
# - Append everything in `array2` from `index2` to the end; those are values
#   that wouldn't pass the `array2[index2] <= element1` above.
# - Return `merged`.

# **PEDAC for Merge Sort**
# *P*
# Input: Array
# Output: Sorted array
#
# Break the array down into nested arrays containing one element each, e.g.:
# [9, 5, 7, 1, 3] ->
# [[9, 5], [7, 1, 3]] ->
# [[[9], [5]], [[7], [1, 3]]] ->
# [[[9], [5]], [[7], [[1], [3]]]] ->
# ...and then merge each array back together:
# [[5, 9], [[7], [1, 3]]] ->
# [[5, 9], [1, 3, 7]] ->
# [1, 3, 5, 7, 9]
#
# *E*
# merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# merge_sort([5, 3]) == [3, 5]
# merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) ==
#   %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) ==
#   [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
#
# *D*
# - Create an array to hold the broken-down array elements.
#
# *A*
# This problem can be broken down into two major components:
# - A method that merges two sorted arrays (separate PEDAC above).
# - A recursive method that splits the array into nested sub-arrays,
#   then merges them back together two arrays at a time using the first method.
#
# Procedure: merge_sort (recursive)
# (derived from https://www.tutorialspoint.com/data_structures_algorithms/merge_sort_algorithm.htm)
# ---
# Given an array:
#
# - If array length is 1, return array.
# - Split array into two: arr1 and arr2
# - Continue splitting array into 2 recursively:
#   - Set arr1 = merge_sort(arr1).
#   - Set arr2 = merge_sort(arr2).
#     *Those two lines will call merge_sort on each split array until each
#     array's size is 1. When it's finished splitting, arr1 and arr2 will have
#     exactly 1 element each.*
# - Return merge(arr1, arr2)
#   *That will merge the recursively split arrays in reverse order.*

# Array arguments must be sorted.
def merge(array1, array2)
  merged = []
  index2 = 0

  array1.each do |element1|
    while index2 < array2.size && array2[index2] <= element1
      merged << array2[index2]
      index2 += 1
    end

    merged << element1
  end

  merged.concat(array2[index2..-1])
end

def merge_sort(array)
  return array if array.size == 1

  middle_index = array.size / 2
  arr1 = array[0...middle_index]
  arr2 = array[middle_index..-1]

  arr1 = merge_sort(arr1)
  arr2 = merge_sort(arr2)

  merge(arr1, arr2)
end

# Further exploration: perform merge sort non-recursively ("bottom-up").
# TODO: fill in PED of PEDAC...
# *P*
# Sort an array of any size using an existing `merge` function that accepts two
# sorted array arguments and returns a sorted array.
# - Return a new array (don't mutate original).
# - Don't use recursion.

# *E*
# Examples and test cases are the same as for Recursive Merge Sort above.

# *D*
# - Duplicate the original array to prevent mutation.
# - Select sub-arrays to pass to the merge function, then merge the result
#   in-place.

# *A*
# Original source: https://algorithmist.com/wiki/Merge_sort
#
# Clarified algorithm based on original source:
# Overview:
# - Start with a function that merges two sorted arrays, which can be
#   the same function one uses at the end of a recursive merge sort method.
# - The bottom-up merge sort will merge an array in-place, though the merge
#   function creates a new array to hold the sorted elements from each sorted
#   array.
# - Start with a merge size of 1.
# - Pass through the entire array, selecting two adjacent arrays of size
#   [merge size], passing those arrays to the `merge` function.
#   - That returns a single array with the elements merged.
#   - After the first pass, each set of 2 elements from left to right will be
#     sorted.
# - Increase the merge size by multiplying the previous merge size by 2.
# - Continue passing through the array, selecting and merging adjacent sets
#   of sorted arrays.

# Details:
# **Sub-procedure: merge_in_place!(array, merge_start_idx, merge_size)
# - Set `merge_middle` to the start index + sub-array size that's sorted.
#   - I.e., `merge_start_idx + merge_size`.
# - Set `merge_end` to the smaller of either:
#   - Start index through the last index of two adjacent sorted sub-arrays
#     - I.e., `merge_start_idx + (merge_size * 2) - 1`
#   - [OR] Start index through the last element index
#     - I.e., `array.size - 1`
# - Set `first_set` to an `array` sub-array that includes the range from
#   start index up to (excluding) `merge_middle`.
# - Set `second_set` to an `array` sub-array that includes the range from
#   `merge_middle` through (including) `merge_end`.
# - Update the `array` sub-array from `merge_start_idx` through `merge_end` to
#   the result of `merge(first_set, second_set)` (in-place; `array` is mutated).
#
# **Sub-procedure: merge_pass!(array, merge_size)**
# - Set `merge_start_idx` to 0
# - While `merge_start_idx` is less than array.size minus `merge_size`:
#   - Using merge_in_place!, merge two sub-arrays starting at `merge_start_idx`
#     through `merge_size` in-place.
#   - Increase `merge_start_idx` by 2 * `merge_size`
# end
#
# **Main procedure: merge_sort_bottom_up(array)**
# - Reassign array parameter to a variable named `array` to prevent original
#   array mutation.
# - Set `merge_size` to 1.
# - While merge_size < array.size
#   - Using `merge_pass!`, pass through the array to merge sub-array sets of
#     size [merge_size].
#   - Increase merge_size by merge_size * 2.
# - Return `array`.

# Input: array indexed from 0 to array_size-1.
#
# merge_size = 1
# while merge_size < array_size do
#     merge_start_idx = 0
#     while merge_start_idx < array_size-merge_size do
#         merge subarrays array[merge_start_idx..merge_start_idx+merge_size-1] and array[merge_start_idx+merge_size .. min(merge_start_idx+2*merge_size-1,array_size-1)] in-place.
#         merge_start_idx = merge_start_idx + 2 * merge_size
#     merge_size = merge_size * 2

def merge_in_place!(array, merge_start_idx, merge_size)
  merge_middle = merge_start_idx + merge_size
  merge_end = [merge_start_idx + 2 * merge_size - 1, array.size - 1].min

  first_set = array[merge_start_idx...merge_middle]
  second_set = array[merge_middle..merge_end]

  array[merge_start_idx..merge_end] = merge(first_set, second_set)
end

def merge_pass!(array, merge_size)
  merge_start_idx = 0

  while merge_start_idx < array.size - merge_size
    merge_in_place!(array, merge_start_idx, merge_size)

    merge_start_idx += 2 * merge_size
  end
end

def merge_sort_bottom_up(array)
  array = array.dup
  merge_size = 1

  while merge_size < array.size
    merge_pass!(array, merge_size)

    merge_size *= 2
  end

  array
end

require_relative '../../ruby-common/test'
require_relative '../../ruby-common/benchmark_report'

def sorted_big_array_create(element_count)
  (1..element_count).map { rand(element_count) }
end

big_array = sorted_big_array_create(50_000)

TESTS = [
  { input: [9, 5, 7, 1], expected_output: [1, 5, 7, 9] },
  { input: [5, 3], expected_output: [3, 5] },
  { input: [6, 2, 7, 1, 4], expected_output: [1, 2, 4, 6, 7] },
  { input: %w[Sue Pete Alice Tyler Rachel Kim Bonnie],
    expected_output: %w[Alice Bonnie Kim Pete Rachel Sue Tyler] },
  { input: [7, 3, 9, 15, 23, 1, 6, 51, 22,
            37, 54, 43, 5, 25, 35, 18, 46],
    expected_output: [1, 3, 5, 6, 7, 9, 15, 18, 22,
                      23, 25, 35, 37, 43, 46, 51, 54] },
  { input: big_array, expected_output: merge_sort_bottom_up(big_array) }
].freeze

run_tests('merge_sort_bottom_up', TESTS,
          ->(input) { merge_sort_bottom_up(input) })
run_tests('merge_sort_recursive', TESTS, ->(input) { merge_sort(input) })

benchmark_report(
  1, 2, TESTS,
  [
    { label: 'merge_sort_bottom_up',
      method: ->(input) { merge_sort_bottom_up(input) } },
    { label: 'merge_sort_recursive',
      method: ->(input) { merge_sort(input) } }
  ]
)

# Key points learned:
# - The bottom-up algorithm is probably not optimized because it's slower than
#   the recursive approach.
# - The recursive approach is easier to understand and maintain as long as one
#   understands recursion basics.
