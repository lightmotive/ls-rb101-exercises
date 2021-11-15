# frozen_string_literal: true

# Basic logic
# - Return true if there are no open or close parens.
# - Start count = 0.
# - Loop through each char:
#   - Add 1 for open and subtract 1 for close.
#   - If the value ever falls below 0, return false.
# - Return true if count == 0.

# More advanced logic: check for balance with multiple open-close pairs
# - Return false if one set closes while any other set is open.
# - Still return false if any set goes negative.

# Even more advanced logic: check for balance with pairs that use the same
# open-close char, like ' and ".
# - If the open and close char is the same (check with each evaluation),
#   subtract 1 if the set is currently 1.

def balanced_set?(string, char_set)
  count = 0

  string.each_char do |char|
    count += 1 if char == char_set[:open]
    count -= 1 if char == char_set[:close]
    break if count.negative?
  end

  count.zero?
end

def balanced?(string)
  char_sets = [
    { open: '(', close: ')' },
    { open: '[', close: ']' },
    { open: '{', close: '}' },
    { open: '“', close: '”' },
    { open: '‘', close: '’' }
  ]

  char_sets.all? { |char_set| balanced_set?(string, char_set) }
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('“What ((is)) up”') == true
p balanced?('What {[((is))]} up') == true
p balanced?('What {[((is))] up') == false
p balanced?('What ‘is’ up’') == false
p balanced?('[(])') == false
p balanced?("'syntax error...") == false
p balanced?('"syntax complete!"') == true

# To solve that, one would need to track balance across all char sets.
