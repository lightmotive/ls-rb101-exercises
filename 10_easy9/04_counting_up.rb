# frozen_string_literal: true

def sequence(to_number)
  (1..to_number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
