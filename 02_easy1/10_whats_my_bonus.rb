# frozen_string_literal: true

def calculate_bonus(salary, award_bonus)
  award_bonus ? (salary.to_f / 2).round(1) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false).zero?
puts calculate_bonus(50_000, true) == 25_000
puts calculate_bonus(49_959, true) == (49_959.to_f / 2).round(1)
