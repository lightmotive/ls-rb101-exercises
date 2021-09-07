# frozen_string_literal: true

def double_consonants(string)
  consonants = /([b-df-hj-np-tv-z])/i
  string.gsub(consonants, '\1' * 2)
end

p double_consonants('String') == 'SSttrrinngg'
p double_consonants('Hello-World!') == 'HHellllo-WWorrlldd!'
p double_consonants('July 4th') == 'JJullyy 4tthh'
p double_consonants('') == ''
