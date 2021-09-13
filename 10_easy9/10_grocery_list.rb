# frozen_string_literal: true

def buy_fruit(list)
  list.map { |(item, count)| [item] * count }.flatten
end

p buy_fruit([['apples', 3], ['orange', 1], ['bananas', 2]]) == %w[apples apples apples orange bananas bananas]
