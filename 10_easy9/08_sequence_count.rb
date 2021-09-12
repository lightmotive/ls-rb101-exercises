# frozen_string_literal: true

def sequence(count, first)
  result = []
  current_multiple = first

  count.times do
    result << current_multiple
    current_multiple += first
  end

  result

  # Or, more succinctly:
  # (1..count).map { |multiple| first * multiple }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1_000_000) == []
