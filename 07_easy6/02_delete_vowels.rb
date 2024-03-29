# frozen_string_literal: true

def remove_vowels(array)
  array.map { |string| string.gsub(/[AEIOUaeiou]/, '') }
end

p remove_vowels(%w[abcdefghijklmnopqrstuvwxyz]) == %w[bcdfghjklmnpqrstvwxyz]
p remove_vowels(%w[green YELLOW black white]) == %w[grn YLLW blck wht]
p remove_vowels(%w[ABC AEIOU XYZ]) == ['BC', '', 'XYZ']
