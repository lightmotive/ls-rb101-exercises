# frozen_string_literal: true

def get_grade(*grades)
  average = grades.sum / grades.count

  case average
  when 101..Float::INFINITY then 'A+'
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  when 0...60 then 'F'
  end
end

p get_grade(95, 90, 93) == 'A'
p get_grade(50, 50, 95) == 'D'
p get_grade(99, 100, 107) == 'A+'
