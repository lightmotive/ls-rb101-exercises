# frozen_string_literal: true

def swap(sentence)
  sentence.split.map do |word|
    chars = word.chars
    chars[0] = word.chars.last
    chars[-1] = word.chars.first
    chars.join
  end.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
