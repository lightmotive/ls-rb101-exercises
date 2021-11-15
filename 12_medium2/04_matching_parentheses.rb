# frozen_string_literal: true

# Basic logic
# - Return true if there are no open or close parens.
# - Start count = 0.
# - Loop through each char:
#   - Add 1 for open and subtract 1 for close.
#   - If the value ever falls below 0, return false.
# - Return true if count == 0.

def balanced?(string)
  count = 0

  string.each_char do |char|
    count += 1 if char == '('
    count -= 1 if char == ')'
    break if count.negative?
  end

  count.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
