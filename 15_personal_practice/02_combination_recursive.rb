# frozen_string_literal: true

# Write a Ruby-flavored algorithm that generates an array of unique combinations
# of `n` elements within a given array, then implement.

# Implementation adapted from this source: https://www.geeksforgeeks.org/print-all-possible-combinations-of-r-elements-in-a-given-array-of-size-n/

# TODO: encapsulate combination selection
#   - Yield each combination as an array of indices
#   - Select the data at those indices as a group from input_array.
#   - Then, there's no need to pass input_array to `combination_recurse`, and
#     the combination selection algorithm can be used with virtually any structure.

# rubocop:disable Metrics/ParameterLists
def combination_recurse(input_array, c_size, start_idx = 0,
                        combo = [], combo_idx = 0, combos = [])
  return (combos << combo.dup) if combo_idx == c_size

  end_idx = input_array.size - 1

  # Simpler loop adapted from [this source](https://www.baeldung.com/java-combinations-algorithm#:~:text=let's%20write%20the%20recursive%20method%20to%20implement%20this%20approach)
  max = [end_idx, end_idx + 1 - combo.length + combo_idx].min
  (start_idx..max).each do |idx|
    combo[combo_idx] = input_array[idx]
    combination_recurse(input_array, c_size, idx + 1, combo, combo_idx + 1, combos)
  end

  combos
end
# rubocop:enable Metrics/ParameterLists

def combination(input_array, c_size)
  combination_recurse(input_array, c_size)
end

p combination([12], 1) == [[12]]
p combination([12, 13, 7, 5], 1) == [[12], [13], [7], [5]]
p combination([12, 13, 7, 5], 2) == [[12, 13], [12, 7], [12, 5], [13, 7], [13, 5], [7, 5]]
p combination([12, 13, 7, 5], 3) == [[12, 13, 7], [12, 13, 5], [12, 7, 5], [13, 7, 5]]

p combination([12, 13, 7, 5, 10], 2) == [[12, 13], [12, 7], [12, 5], [12, 10], [13, 7], [13, 5], [13, 10], [7, 5],
                                         [7, 10], [5, 10]]

p combination([12, 13, 7, 5, 10], 3) == [[12, 13, 7], [12, 13, 5], [12, 13, 10], [12, 7, 5], [12, 7, 10], [12, 5, 10],
                                         [13, 7, 5], [13, 7, 10], [13, 5, 10], [7, 5, 10]]

p combination([12, 13, 7, 5], 4) == [[12, 13, 7, 5]]

p combination([12, 13, 7, 5, 10, 16], 4) == [[12, 13, 7, 5], [12, 13, 7, 10], [12, 13, 7, 16], [12, 13, 5, 10],
                                             [12, 13, 5, 16], [12, 13, 10, 16], [12, 7, 5, 10], [12, 7, 5, 16],
                                             [12, 7, 10, 16], [12, 5, 10, 16], [13, 7, 5, 10], [13, 7, 5, 16],
                                             [13, 7, 10, 16], [13, 5, 10, 16], [7, 5, 10, 16]]

p combination([12, 13, 7, 5, 10, 16, 21], 4) == [[12, 13, 7, 5], [12, 13, 7, 10], [12, 13, 7, 16], [12, 13, 7, 21],
                                                 [12, 13, 5, 10], [12, 13, 5, 16], [12, 13, 5, 21], [12, 13, 10, 16],
                                                 [12, 13, 10, 21], [12, 13, 16, 21], [12, 7, 5, 10], [12, 7, 5, 16],
                                                 [12, 7, 5, 21], [12, 7, 10, 16], [12, 7, 10, 21], [12, 7, 16, 21],
                                                 [12, 5, 10, 16], [12, 5, 10, 21], [12, 5, 16, 21], [12, 10, 16, 21],
                                                 [13, 7, 5, 10], [13, 7, 5, 16], [13, 7, 5, 21], [13, 7, 10, 16],
                                                 [13, 7, 10, 21], [13, 7, 16, 21], [13, 5, 10, 16], [13, 5, 10, 21],
                                                 [13, 5, 16, 21], [13, 10, 16, 21], [7, 5, 10, 16], [7, 5, 10, 21],
                                                 [7, 5, 16, 21], [7, 10, 16, 21], [5, 10, 16, 21]]

# - idx0: iterate through all until only c_size elements remain; i.e., 0..(arr.size - c_size).
#   - iterate through all indices after idx0 to identify idx1
#     - iterate through all indices after idx1 to identify idx2
#       - iterate through all indices after idx2 to identify idx3

# - Loop: 0..(arr.size - c_size) do |start_idx|
#   - Dig (recurse) until `c_size - 1` levels deep:
#     If c_size = 2, it will recurse once.
#     If c_size = 3, it will recurse twice, and so on.
#     - Once our combination array size == c_size, return the combination.
#     - Iterate through the remaining elements after the last combination's element

=begin
def combination_indices(start_idx, arr_size, c_size, combo = [])
  - Base case x: `combo.size` == c_size and combo.last != arr_size - 1
    - Loop through remaining indices, copying `combo` and replacing the last
      element with the iterated index.
      - yield each combo
    - return
  - Base case x: `combo.size` == c_size and combo.last == arr_size - 1
    - yield combo
    - return (no more recursion)

  ***

  - Recursion: `combo` is not yet full...
    combination_indices(start_idx, arr_size, c_size, ...)
    - Build each possible `combo` from start_idx:
      - Recursive case x: `combo.size > 1` && `combo.last < (arr_size - c_size)`
        - increment last element (index)
      - Recursive case x: `combo.size == 1`
        - combo << start_idx + 1
      - Recursive case x: `combo.empty?`
        - [start_idx]...
end

def combination(arr, c_size)
  combos = []
  (0..(arr.size - c_size)).each do |start_idx|
    combos = combination_indices(start_idx, arr.size).map {|combo_indices| }
  end
end
=end
