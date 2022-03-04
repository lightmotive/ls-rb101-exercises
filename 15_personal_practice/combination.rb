# frozen_string_literal: true

# Write a Ruby-flavored algorithm that generates an array of unique combinations
# of `n` elements within a given array, then implement.

# combination([12, 13, 7, 5], 2) | array, c_count

# Values   -- Indices
# ******   -- *******
# [12, 13] -- [0, 1, -, -]
# [12, 7]  -- [0, -, 2, -]
# [12, 5]  -- [0, -, -, 3]
# [13, 7]  -- [-, 1, 2, -]
# [13, 5]  -- [-, 1, -, 3]
# [7, 5]   -- [-, -, 2, 3] -- Iteration ends
# ***
# combos = []
# tail_size = c_count - 1
# (0..(array.size - c_count)): start_idx
#   ((start_idx + 1)...(array.size - tail_size)): tail_start_idx
#     combos << (array[start_idx] + array[tail_start_idx, tail_size])

# combination([12, 13, 7, 5], 3) | array, c_count

# start_idx = 0
# [12, 13, 7] -- [0, 1, 2, -]
# [12, 13, 5] -- [0, 1, -, 3]
# [12, 7, 5]  -- [0, -, 2, 3]
# start_idx = 1
# [13, 7, 5]  -- [-, 1, 2, 3]
# ***
# tail_size = c_count - 2
# (0..(array.size - c_count)): start_idx
#   ((start_idx + 1)...(array.size - tail_size): tail_start_idx
#     ((tail_start_idx + tail_size + 1)...array.size): tail_end_idx
#       combos << (array[start_idx] + array[tail_start_idx, tail_size] + array[tail_end_idx])

p combination([12, 13, 7, 5], 2).sort == [[12, 13], [12, 7], [12, 5], [13, 7], [13, 5], [7, 5]].sort
p combination([12, 13, 7, 5], 3).sort == [[12, 13, 7], [12, 13, 5], [12, 7, 5], [13, 7, 5]].sort
p combination([12, 13, 7, 5], 4).sort == [[12, 13, 7, 5]].sort
p combination([12, 13, 7, 5, 10, 16], 4).sort == [[12, 13, 7, 5],
                                                  [12, 13, 7, 10],
                                                  [12, 13, 7, 16],
                                                  [12, 13, 5, 10],
                                                  [12, 13, 5, 16],
                                                  [12, 13, 10, 16],
                                                  [12, 7, 5, 10],
                                                  [12, 7, 5, 16],
                                                  [12, 7, 10, 16],
                                                  [12, 5, 10, 16],
                                                  [13, 7, 5, 10],
                                                  [13, 7, 5, 16],
                                                  [13, 7, 10, 16],
                                                  [13, 5, 10, 16],
                                                  [7, 5, 10, 16]].sort
