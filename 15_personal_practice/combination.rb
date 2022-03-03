# frozen_string_literal: true

# Write a Ruby-flavored algorithm that generates an array of unique combinations
# of `n` elements within a given array, then implement.

# Given array and c_length, e.g., [12, 13, 7, 5] and 2:
#
# Combos   -- Indices
# [12, 13] -- [0, 1, -, -]
# [12, 7]  -- [0, -, 2, -]
# [12, 5]  -- [0, -, -, 3]
# [13, 7]  -- [-, 1, 2, -]
# [13, 5]  -- [-, 1, -, 3]
# [7, 5]   -- [-, -, 2, 3]
#
# Given array and c_length, e.g., [12, 13, 7, 5] and 3:
#
# [12, 13, 7] -- [0, 1, 2, -]
# [12, 13, 5] -- [0, 1, -, 3]
# [12, 7, 5]  -- [0, -, 2, 3]
# [13, 7, 5]  -- [-, 1, 2, 3 (last)]
#
# ***
#
# - combos = []
# - FROM 0 to (size - c_length): start_idx
#   - combo = [start_idx, take c_length - 1]
#   - FROM start_idx + (c_length - 1) + 1: tail_idx
#     - combo.concat(array[tail_idx])
#   - combos << combo
# - Return combos

def combination(array, c_length)
  # - combos = []
  # - FROM 0 to (size - c_length): start_idx
  #   - combo = [start_idx, take c_length - 1]
  #   - FROM start_idx + (c_length - 1) + 1: tail_idx
  #     - combo.concat(array[tail_idx])
  #   - combos << combo
  # - Return combos
end

p combination([12, 13, 7, 5], 2) == [[12, 13], [12, 7], [12, 5], [13, 7], [13, 5], [7, 5]]
p combination([12, 13, 7, 5], 3) == [[12, 13, 7], [12, 13, 5], [12, 7, 5], [13, 7, 5]]
