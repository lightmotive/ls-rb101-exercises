# frozen_string_literal: true

# Because the last digit of Fibonacci numbers repeats every 60 numbers,
# we can simply store those numbers and reference the [nth % 60]th number!
# Source: https://www.jain108.com/fibonacci-60-code/
NTH_FIBONACCI_LAST_DIGIT_MOD60 = '011235831459437077415617853819' \
  '099875279651673033695493257291'.chars.map(&:to_i)

def fibonacci_last(nth)
  # return 0 if nth.zero?
  # return 1 if nth < 3

  # last2 = [0, 1]
  # 2.upto(nth) do
  #   last2 = [last2.last, (last2.first + last2.last) % 10]
  # end

  # last2.last

  # No need to calculate using above code because of Fibonacci's repetition:
  NTH_FIBONACCI_LAST_DIGIT_MOD60[nth % 60]
end

p fibonacci_last(15).zero?
p fibonacci_last(20) == 5
p fibonacci_last(100) == 5
p fibonacci_last(100_001) == 1
p fibonacci_last(1_000_007) == 3
p fibonacci_last(123_456_789) == 4
p fibonacci_last(123_456_789_987_745) == 5
