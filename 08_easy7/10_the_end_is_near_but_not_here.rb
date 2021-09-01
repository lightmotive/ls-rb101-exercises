# frozen_string_literal: true

def penultimate_word(string)
  string.split[-2]
end

p penultimate_word('last word') == 'last'
p penultimate_word('Launch School is great!') == 'is'
