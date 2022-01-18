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
# *A*
# Src: https://algorithmist.com/wiki/Merge_sort
# Input: array a[] indexed from 0 to n-1.
#
# m = 1
# while m < n do
#     i = 0
#     while i < n-m do
#         merge subarrays a[i..i+m-1] and a[i+m .. min(i+2*m-1,n-1)] in-place.
#         i = i + 2 * m
#     m = m * 2

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

def merge_sort_non_recursive(array)
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

TESTS = [
  { input: [9, 5, 7, 1], expected_output: [1, 5, 7, 9] },
  { input: [5, 3], expected_output: [3, 5] },
  { input: [6, 2, 7, 1, 4], expected_output: [1, 2, 4, 6, 7] },
  { input: %w[Sue Pete Alice Tyler Rachel Kim Bonnie],
    expected_output: %w[Alice Bonnie Kim Pete Rachel Sue Tyler] },
  { input: [7, 3, 9, 15, 23, 1, 6, 51, 22,
            37, 54, 43, 5, 25, 35, 18, 46],
    expected_output: [1, 3, 5, 6, 7, 9, 15, 18, 22,
                      23, 25, 35, 37, 43, 46, 51, 54] }
  # , { input: [big_array1, big_array2],
  #   expected_output: merge_multiple_passes(big_array1, big_array2) }
].freeze

run_tests('merge_sort', TESTS, ->(input) { merge_sort(input) })
run_tests('merge_sort_non_recursive', TESTS,
          ->(input) { merge_sort_non_recursive(input) })

benchmark_report(
  2, 200, TESTS,
  [
    { label: 'merge_sort',
      method: ->(input) { merge_sort(input) } },
    { label: 'merge_sort_non_recursive',
      method: ->(input) { merge_sort_non_recursive(input) } }
  ]
)
