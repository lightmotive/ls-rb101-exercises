# frozen_string_literal: true

def multiply_all_pairs(*arrays)
  arrays[0].product(*arrays[1, arrays.size - 1]).map { |pair| pair.inject(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
