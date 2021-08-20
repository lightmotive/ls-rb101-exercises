# frozen_string_literal: true

def find_fibonacci_index_by_length(length)
  index = 1
  previous2 = 0
  previous = 1

  loop do
    index += 1
    current_number = previous2 + previous
    number_length = current_number.to_s.length
    break index if number_length == length
    break nil if number_length > length

    # The problem statement didn't specify what to return if there were no sequence numbers that matched the specified
    # length. I would want to clarify that with the statement author. For now, we'll return nil for that edge case.

    # Interesting note: 'current_number.digits.size' was much slower than current_number.to_s.length

    previous2 = previous
    previous = current_number
  end
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10_000) == 47_847
