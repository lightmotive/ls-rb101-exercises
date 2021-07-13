# frozen_string_literal: true

def multiply(arg1, arg2)
  arg1 * arg2
end

def square(arg)
  multiply(arg, arg)
end

def exponentiate(base, exponent)
  return 1.to_r if exponent.zero?

  exponentiated = 1
  exponent.abs.times { exponentiated = multiply(exponentiated, base) }

  return (1.to_r / exponentiated) if exponent.negative?

  exponentiated.to_r
end

p square(2)
p exponentiate(2, 3)
p exponentiate(2, -3)
p exponentiate(2, -5).to_f
p exponentiate(2, 0).to_i
