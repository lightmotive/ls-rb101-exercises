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
    { open: set[0], close: set[1], count: 0, close_before_sets: [] }
  end
end

def sets_open(sets, except_set: nil)
  sets_open = sets.select { |set| set[:count].positive? }
  return sets_open if except_set.nil?

  sets_open.reject do |set|
    set[:open] == except_set[:open]
  end
end

def update_sets_open!(set, sets)
  set[:count] += 1
  other_sets_open = sets_open(sets, except_set: set)
  return if set[:count] != 1 || other_sets_open.empty?

  other_sets_open.each do |open_set|
    set[:close_before_sets].push(
      { close: open_set[:close], count_min: open_set[:count] }
    )
  end
end

def update_sets_close!(set)
  set[:count] -= 1
  set[:close_before_sets].clear if set[:count].zero?
end

def update_sets!(char, sets)
  set_arr = sets.select { |set| [set[:open], set[:close]].include?(char) }
  return if set_arr.empty?

  set = set_arr.first

  update_sets_open!(set, sets) if char == set[:open]
  update_sets_close!(set) if char == set[:close]

  nil
end

def char_sets_trapped(sets)
  sets.select do |set|
    close_before_sets = set[:close_before_sets]
    next false if close_before_sets.empty?

    close_before_sets.any? do |close_before_set|
      sets.any? do |set2|
        set2[:close] == close_before_set[:close] &&
          set2[:count] < close_before_set[:count_min]
      end
    end
  end
end

def char_set_trapped?(sets)
  !char_sets_trapped(sets).empty?
end

def char_sets_broken?(sets)
  return true if sets.any? { |set| set[:count].negative? }
  return true if char_set_trapped?(sets)

  false
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
p balanced?('[(]') == false
p balanced?('[)]') == false
p balanced?('[(])([)][]') == false

# Support for these test cases is coming soon!
# p balanced?("'syntax error...") == false
# p balanced?('"syntax complete!"') == true
