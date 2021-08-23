# frozen_string_literal: true

def interleave(*arrays)
  interleaved = []
  arrays[0].each_index do |index|
    arrays.each do |array|
      interleaved << array[index]
    end
  end

  interleaved
end

p interleave([1, 2, 3], %w[a b c]) == [1, 'a', 2, 'b', 3, 'c']
p interleave([1, 2, 3], %w[a b c], %i[x y z]) == [1, 'a', :x, 2, 'b', :y, 3, 'c', :z]
p interleave([], []) == []
p interleave([1, 2, 3], %w[a b c], %i[x y]) == [1, 'a', :x, 2, 'b', :y, 3, 'c', nil]
