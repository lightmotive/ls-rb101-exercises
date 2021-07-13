# frozen_string_literal: true

def oddities(array)
  array.select.with_index { |e, idx| idx.even? ? e : nil }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(%w[abc def]) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
