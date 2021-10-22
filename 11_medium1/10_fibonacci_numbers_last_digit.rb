# frozen_string_literal: true

def fibonacci_last(nth)
  return 0 if nth.zero?
  return 1 if nth < 3

  last2 = [0, 1]
  2.upto(nth) do
    last2 = [last2.last, (last2.first + last2.last) % 10]
  end

  last2.last
end

p fibonacci_last(15).zero?
p fibonacci_last(20) == 5
p fibonacci_last(100) == 5
p fibonacci_last(100_001) == 1
p fibonacci_last(1_000_007) == 3
p fibonacci_last(123_456_789) == 4
