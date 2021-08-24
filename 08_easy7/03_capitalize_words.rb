# frozen_string_literal: true

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Alternative solutions
def word_cap_with_indexed_assignment(string)
  string.split.map do |word|
    word.downcase!
    word[0] = word[0].upcase
    word
  end.join(' ')
end

p word_cap_with_indexed_assignment('four score and seven') == 'Four Score And Seven'
p word_cap_with_indexed_assignment('the javaScript language') == 'The Javascript Language'
p word_cap_with_indexed_assignment('this is a "quoted" word') == 'This Is A "quoted" Word'

def word_cap_with_each_char(string)
  capitalized = String.new
  string.each_char.with_index do |char, idx|
    char = if idx.zero? || string[idx - 1] == ' '
             char.upcase
           else
             char.downcase
           end
    capitalized << char
  end
  capitalized
end

p word_cap_with_each_char('four score and seven') == 'Four Score And Seven'
p word_cap_with_each_char('the javaScript language') == 'The Javascript Language'
p word_cap_with_each_char('this is a "quoted" word') == 'This Is A "quoted" Word'
