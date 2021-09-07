# frozen_string_literal: true

# Basic logic:
# - Loop through each number
# - Evaluate whether the number is divisible by 3, 5, or both
# - Build array with outputs.
# - Print array joined with commas.

def fizzbuzz_value(num)
  div_by5 = (num % 5).zero?
  div_by3 = (num % 3).zero?

  if div_by5 && div_by3 then 'FizzBuzz'
  elsif div_by5 then 'Buzz'
  elsif div_by3 then 'Fizz'
  else num
  end
end

def fizzbuzz(start_num, end_num)
  (start_num..end_num).map do |num|
    fizzbuzz_value(num)
  end
end

p(fizzbuzz(1, 15).join(', ') == '1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz')
