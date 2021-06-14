# frozen_string_literal: true

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

p digit_list(12_345) == [1, 2, 3, 4, 5]
p digit_list(7) == [7]
p digit_list(375_290) == [3, 7, 5, 2, 9, 0]
p digit_list(444) == [4, 4, 4]
p digit_list(nil) == []
