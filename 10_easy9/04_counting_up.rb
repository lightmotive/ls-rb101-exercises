# frozen_string_literal: true

# Further exploration: allow negative argument.
# Questions I would ask:
# - With a positive argument, we count UP from 1 to the argument.
#   If negative, should it count DOWN from -1 to the argument, or the argument to -1 (still count UP)?
#   Without additional input, I would default to counting down for a negative argument.
# Either way, I don't think this method is intuitive; I would not write it on my own.
#   Would it be better to have specific methods like Ruby's Integer#upto and #downto?
#   Or would you want another argument that specifies the sequence direction.

def sequence(end_number)
  end_number.positive? ? (1..end_number).to_a : -1.downto(end_number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(0) == []
p sequence(-5) == [-1, -2, -3, -4, -5]
