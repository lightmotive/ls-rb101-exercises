# frozen_string_literal: true

def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements

  # Declarative solution (likely less performant): array.select.with_index { |e, idx| idx.even? ? e : nil }
end

def conformities(array)
  even_elements = []
  index = 1
  while index < array.size
    even_elements << array[index]
    index += 2
  end
  even_elements

  # Declarative solution (likely less performant): array.select.with_index { |e, idx| idx.odd? ? e : nil }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(%w[abc def]) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([nil]) == [nil]

p conformities([2, 3, 4, 5, 6]) == [3, 5]
p conformities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p conformities(%w[abc def]) == ['def']
p conformities([123]) == []
p conformities([]) == []
