# frozen_string_literal: true

def swap_first_last(array)
  array[0], array[-1] = array[-1], array[0]
  array
end

def swap(sentence)
  sentence.split.map { |word| swap_first_last(word) }.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Further exploration
# Would the following work? Why or why not?
# def swap_first_last(a, b)
#   a, b = b, a
# end
#
# def swap(sentence)
#   sentence.split.map { |word| swap_first_last(word[0], word[-1]) }.join(' ')
# end
#
# That wouldn't work for multiple reasons:
# 1. Ruby employs strict evaluation, which means it evaluates expressions and converts the result to objects
#    before passing them to methods. The alternative swap_first_last method above is passing strings
#    (single characters) to the method, not the word index references. Therefore, it cannot modify the word array
#    as we require.
# 2. The alternative swap_first_last method uses assignment, which never mutates the caller. The first swap_first_last
#    implementation uses indexed assignment, which mutates the elements stored in the array.
