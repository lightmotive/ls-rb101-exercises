# frozen_string_literal: true

def repeater(string)
  string.each_char.map { |char| char * 2 }.join
end

p repeater('Hello') == 'HHeelllloo'
p repeater('Good job!') == 'GGoooodd  jjoobb!!'
p repeater('') == ''
