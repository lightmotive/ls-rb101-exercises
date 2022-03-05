# frozen_string_literal: true

# Write a Ruby-flavored algorithm that generates an array of unique combinations
# of `n` elements within a given array, then implement.

# Implementation adapted from this source: https://www.geeksforgeeks.org/print-all-possible-combinations-of-r-elements-in-a-given-array-of-size-n/
# Due to time constraints, I decided not to fully understand this algorithm
# at a deep level. This is a solved problem for which I see no need to solve
# again at this point in my career.

# rubocop:disable Metrics/ParameterLists
def combination_recurse!(input_array, combo, input_start_idx, input_end_idx,
                         combo_idx, c_size, combos)
  return combos << combo.dup if combo_idx == c_size

  # Replace combo_idx with all possible elements.
  # The condition "input_end_idx-idx+1 >= c_size-combo_idx" makes sure that including one
  # element at combo_idx will make a combination with remaining elements at
  # remaining positions.
  idx = input_start_idx
  while (idx <= input_end_idx) &&
        ((input_end_idx - idx + 1) >= (c_size - combo_idx))
    combo[combo_idx] = input_array[idx]
    combination_recurse!(input_array, combo, idx + 1, input_end_idx,
                         combo_idx + 1, c_size, combos)
    idx += 1
  end
end
# rubocop:enable Metrics/ParameterLists

def combination(input_array, c_size)
  combo = [0] * c_size
  combos = []

  combination_recurse!(input_array, combo, 0, input_array.size - 1, 0, c_size, combos)

  combos
end

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
