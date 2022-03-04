# frozen_string_literal: true

# Write a Ruby-flavored algorithm that generates an array of unique combinations
# of `n` elements within a given array, then implement.

# combination([12, 13, 7, 5], 2) | array, c_count

=begin
Values   -- Indices
******   -- *******
[12, 13] -- [0, 1, -, -]
[12, 7]  -- [0, -, 2, -]
[12, 5]  -- [0, -, -, 3]
[13, 7]  -- [-, 1, 2, -]
[13, 5]  -- [-, 1, -, 3]
[7, 5]   -- [-, -, 2, 3] -- Iteration ends
***
combos = []
tail_size = c_count - 1
(0..(array.size - c_count)): start_idx
  (start_idx...array.size - tail_size): tail_start_idx
    combos << (array[start_idx] + array[tail_start_idx, tail_size])
=end

# combination([12, 13, 7, 5], 3) | array, c_count
=begin
[12, 13, 7]
[12, 13, 5]
[12, 7, 5]
[13, 7, 5]
=end

p combination([12, 13, 7, 5], 2) == [[12, 13], [12, 7], [12, 5], [13, 7], [13, 5], [7, 5]]
p combination([12, 13, 7, 5], 3) == [[12, 13, 7], [12, 13, 5], [12, 7, 5], [13, 7, 5]]
