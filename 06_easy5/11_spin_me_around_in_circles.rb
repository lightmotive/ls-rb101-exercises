# frozen_string_literal: true

# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same
# words, but with each word's characters reversed. Given the method's implementation, will the returned string be
# the same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(' ')
end

spin_me('hello world') # "olleh dlrow"

# Answer: The spin_me method will return a different object than the passed argument
# because the String#split method returns a new string.
