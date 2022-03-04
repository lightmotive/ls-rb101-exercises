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
# middle_size = c_count - 1
# (0..(array.size - c_count)): start_idx
#   ((start_idx + 1)...(array.size - middle_size)): middle_start_idx
#     combos << (array[start_idx] + array[middle_start_idx, middle_size])

# combination([12, 13, 7, 5], 3) | array, c_count

# start_idx = 0
# [12, 13, 7] -- [0, 1, 2, -]
# [12, 13, 5] -- [0, 1, -, 3]
# [12, 7, 5]  -- [0, -, 2, 3]
# start_idx = 1
# [13, 7, 5]  -- [-, 1, 2, 3]
# ***
# middle_size = c_count - 2
# (0..(array.size - c_count)): start_idx
#   1.upto(middle_offset_max): middle_offset (possible middle starting points, with a minimum of 1)
#     ((start_idx + middle_offset + middle_size)...array.size): end_idx
#       combos << ([array[start_idx]] + array[start_idx + middle_offset, middle_size] + [array[end_idx]])

def combination_middle_offset_max(array, c_count)
  return 1 if c_count < 3

  middle_size = c_count - 2

  array.size - middle_size - 1
end

def combos_from_start(array, c_count, start_idx)
  combos = []
  middle_size = c_count - 2
  middle_offset_max = combination_middle_offset_max(array, c_count)

  1.upto(middle_offset_max) do |middle_offset|
    ((start_idx + middle_offset + middle_size)...array.size).each do |end_idx|
      p [start_idx, "#{start_idx + middle_offset}, #{middle_size}", end_idx]
      combos << ([array[start_idx]] + array[start_idx + middle_offset, middle_size] + [array[end_idx]])
    end
  end

  combos
end

def combination(array, c_count)
  combos = []
  # middle_offset_max = combination_middle_offset_max(array, c_count)

  (0..(array.size - c_count)).each do |start_idx|
    combos.append(*combos_from_start(array, c_count, start_idx))
  end

  combos
end

# p combination([12, 13, 7, 5], 2).sort == [[12, 13], [12, 7], [12, 5], [13, 7], [13, 5], [7, 5]].sort
# p combination([12, 13, 7, 5], 3).sort == [[12, 13, 7], [12, 13, 5], [12, 7, 5], [13, 7, 5]].sort
# p combination([12, 13, 7, 5], 4).sort == [[12, 13, 7, 5]].sort
p combination([12, 13, 7, 5, 10, 16], 4).sort #== [[12, 13, 7, 5],
#                                                   [12, 13, 7, 10],
#                                                   [12, 13, 7, 16],
#                                                   [12, 13, 5, 10],
#                                                   [12, 13, 5, 16],
#                                                   [12, 13, 10, 16],
#                                                   [12, 7, 5, 10],
#                                                   [12, 7, 5, 16],
#                                                   [12, 7, 10, 16],
#                                                   [12, 5, 10, 16],
#                                                   [13, 7, 5, 10],
#                                                   [13, 7, 5, 16],
#                                                   [13, 7, 10, 16],
#                                                   [13, 5, 10, 16],
#                                                   [7, 5, 10, 16]].sort
