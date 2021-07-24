# frozen_string_literal: true

def swap_first_and_last(array)
  array[0], array[-1] = array[-1], array[0]
  array
end

def swap(sentence)
  sentence.split.map { |word| swap_first_and_last(word) }.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
