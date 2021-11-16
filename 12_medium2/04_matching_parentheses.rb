# frozen_string_literal: true

# Basic logic
# - Return true if there are no open or close parens.
# - Start count = 0.
# - Loop through each char:
#   - Add 1 for open and subtract 1 for close.
#   - If the value ever falls below 0, return false.
# - Return true if count == 0.

# More advanced logic: check for balanced pairs within pairs so the following
# tests pass:
#   - p balanced?('[)]') == false
#   - p balanced?('[(])([)][]') == false
#   - p balanced?("'syntax error...") == false
#   - p balanced?('"syntax complete!"') == true
#   - p balanced?('content ) [other "content"] ( end') == false
# A previous implementation used manual pair tracking. A simpler solution might
# use Regexp by basically looping through strings that reduce in size:
#   - Find all pairs with content, e.g., /\(.*\)/ (loop through all pairs and
#     concatenate list).
#     - Evaluate content before and after matching pairs. This regexp should
#       match content before the first pair char and after last pair char
#       (open or close). If the content contains any pair char, it's unbalanced.
#   - Evaluate each match's content (within pair chars) to ensure all is
#     balanced within matching pairs.

# Even more advanced logic: check for balance with pairs that use the same
# open-close char, like ' and ".
# - If the open and close char is the same (check with each evaluation),
#   subtract 1 if the set is currently 1.

PAIRS = %w[() [] {} “” ‘’].freeze

def pairs_initialize(pairs = PAIRS)
  pairs.map do |set|
    { open: set[0], close: set[1], count: 0, close_before_pairs: [] }
  end
end

def pairs_open(pairs, except_set: nil)
  pairs_open = pairs.select { |set| set[:count].positive? }
  return pairs_open if except_set.nil?

  pairs_open.reject do |set|
    set[:open] == except_set[:open]
  end
end

def update_pairs_open!(set, pairs)
  set[:count] += 1
  other_pairs_open = pairs_open(pairs, except_set: set)
  return if set[:count] != 1 || other_pairs_open.empty?

  other_pairs_open.each do |open_set|
    set[:close_before_pairs].push(
      { close: open_set[:close], count_min: open_set[:count] }
    )
  end
end

def update_pairs_close!(set)
  set[:count] -= 1
  set[:close_before_pairs].clear if set[:count].zero?
end

def update_pairs!(char, pairs)
  set_arr = pairs.select { |set| [set[:open], set[:close]].include?(char) }
  return if set_arr.empty?

  set = set_arr.first

  update_pairs_open!(set, pairs) if char == set[:open]
  update_pairs_close!(set) if char == set[:close]

  nil
end

def pairs_trapped(pairs)
  pairs.select do |set|
    close_before_pairs = set[:close_before_pairs]
    next false if close_before_pairs.empty?

    close_before_pairs.any? do |close_before_set|
      pairs.any? do |set2|
        set2[:close] == close_before_set[:close] &&
          set2[:count] < close_before_set[:count_min]
      end
    end
  end
end

def char_set_trapped?(pairs)
  !pairs_trapped(pairs).empty?
end

def pairs_broken?(pairs)
  return true if pairs.any? { |set| set[:count].negative? }
  return true if char_set_trapped?(pairs)

  false
end

def pairs_balanced?(pairs)
  return false if pairs.any? { |set| set[:count] != 0 }

  true
end

def balanced?(string)
  pairs = pairs_initialize

  string.each_char do |char|
    # - Return false if one set closes while any other set is open.
    # - Still return false if any set goes negative.
    update_pairs!(char, pairs)
    break if pairs_broken?(pairs)
  end

  pairs_balanced?(pairs)
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
