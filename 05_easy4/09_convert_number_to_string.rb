# frozen_string_literal: true

DIGITS = %w[0 1 2 3 4 5 6 7 8 9].freeze

def integer_to_sign(integer)
  return '-' if integer.negative?

  ''
end

def integer_to_string(integer)
  string = String.new
  quotient = integer.abs

  loop do
    quotient, remainder = quotient.divmod(10)
    string.prepend(DIGITS[remainder])
    break if quotient.zero?
  end

  string.prepend(integer_to_sign(integer))
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
p integer_to_string(-123) == '-123'

# Mutating string methods without bang in Ruby v3.0.1:
#
# See https://docs.ruby-lang.org/en/master/String.html (or version-specific page),
# then look for methods that return 'self'.
# Watch out for exceptions like setbyte.
# It really requires experience, experimentation, or scanning the Ruby source code for 'str_duplicate'.
