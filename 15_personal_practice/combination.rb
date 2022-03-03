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
# combos = []
# start_idx = 0
# head_count = c_length
#
# [12, 13, 7] -- [0, 1, 2, -]
#   - tail_offset_idx = start_idx + head_count
#   - tail_count = c_length - head_count
#   - combos << [start_idx, head_count] + [tail_offset_idx, tail_count]
#   - head_count -= 1
# [12, 13, 5] -- [0, 1, -, 3]
#   - tail_offset_idx = start_idx + head_count
#   - tail_count = c_length - head_count
#   - combos << [start_idx, head_count] + [tail_offset_idx, tail_count]
#   - head_count -= 1
# [12, 7, 5]  -- [0, -, 2, 3]
#   - tail_offset_idx = start_idx + head_count
#   - combos << [start_idx, head_count] + [tail_offset_idx, tail_count]
#   - head_count -= 1
# [13, 7, 5]  -- [-, 1, 2, 3 (last)]
#   - tail_offset_idx = start_idx + head_count
#   - combos << [start_idx, head_count] + [tail_offset_idx, tail_count]
#   - head_count -= 1
#
# Return combos

require 'pry'

def combination(array, c_length)
  # ...
end

p combination([12, 13, 7, 5], 2) == [[12, 13], [12, 7], [12, 5], [13, 7], [13, 5], [7, 5]]
p combination([12, 13, 7, 5], 3) == [[12, 13, 7], [12, 13, 5], [12, 7, 5], [13, 7, 5]]
