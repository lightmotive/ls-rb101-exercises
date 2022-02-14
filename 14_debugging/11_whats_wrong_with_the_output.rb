# frozen_string_literal: true

# Josh wants to print an array of numeric strings in reverse numerical order.
# However, the output is wrong. Without removing any code, help Josh get the
# expected output.

arr = %w[9 8 7 10 11]

# The problem: `p` binds more tightly with `arr.sort` than `arr.sort` does
# with the `do...end` block. Therefore, `(p arr.sort)` is executed with the
# block, which essentially ignores the block.
# The solution: wrap `arr.sort do...end` in parenthese.
p(arr.sort do |x, y|
  y.to_i <=> x.to_i
end)

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]
