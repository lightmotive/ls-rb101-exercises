# frozen_string_literal: true

def center_of(string)
  length = string.length
  center_start_index = (length / 2.0).ceil - 1
  length_to_slice = length.odd? ? 1 : 2
  string.slice(center_start_index, length_to_slice)
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
