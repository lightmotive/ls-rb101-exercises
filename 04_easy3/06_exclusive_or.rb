# frozen_string_literal: true

def xor?(*booleans)
  true_count = 0
  booleans.each do |boolean|
    true_count += 1 if boolean
    break false if true_count > 1
  end

  true_count == 1
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
p xor?(5.odd?, 4.odd?, 3.odd?) == false
p xor?(5.even?, 4.even?, 3.even?) == true
