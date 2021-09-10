# frozen_string_literal: true

def double_number?(number)
  string = number.to_s
  return false if string.length.odd?

  left = string.slice!(0, string.length / 2)
  right = string
  return true if left == right

  false
end

def twice(number)
  return number if double_number?(number)

  number * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334_433) == 668_866
p twice(444) == 888
p twice(107) == 214
p twice(103_103) == 103_103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
