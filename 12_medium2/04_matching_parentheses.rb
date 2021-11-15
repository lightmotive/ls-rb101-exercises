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
#   - Track whether any other set opens while a different set is open.
#     - Ensure the second set that opened closes before the first set closes.
# - Still return false if any set goes negative.

# Even more advanced logic: check for balance with pairs that use the same
# open-close char, like ' and ".
# - If the open and close char is the same (check with each evaluation),
#   subtract 1 if the set is currently 1.

CHAR_SETS = %w[() [] {} “” ‘’].freeze

def char_sets_initialize(sets = CHAR_SETS)
  sets.map do |set|
    { open: set[0], close: set[1], count: 0 }
  end
end

def update_sets!(char, sets)
  set_arr = sets.select { |set| [set[:open], set[:close]].include?(char) }
  return if set_arr.empty?

  set = set_arr.first
  set[:count] += 1 if char == set[:open]
  set[:count] -= 1 if char == set[:close]
end

def char_set_trapped?(sets)
  # The "close_before_set" values, if any, is greater than or equal to the
  # associated set state at all times. If it goes below, then the open char set
  # is trapped.
  # Clear the "close_before_set" array when the associated set count goes back
  # to zero.
  # close_before_set data structure:
  #   [ { close: "]", count_min: 1 }, ... ]
end

def char_sets_broken?(sets)
  sets.any? { |set| set[:count].negative? }
end

def char_sets_balanced?(sets)
  return false if sets.any? { |set| set[:count] != 0 }

  true
end

def balanced?(string)
  sets = char_sets_initialize

  string.each_char do |char|
    # - Return false if one set closes while any other set is open.
    # - Still return false if any set goes negative.
    update_sets!(char, sets)
    break if char_sets_broken?(sets)
  end

  char_sets_balanced?(sets)
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
