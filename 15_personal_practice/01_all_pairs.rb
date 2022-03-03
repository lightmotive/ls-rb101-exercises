# Expected output for an example array `[12, 7, 17]`:
# [
#   [12, 7],   # Values at indices: [0, 1]
#   [12, 17],  # Values at indices: [0, 2]
#   [7, 17]    # Values at indices: [1, 2]
# ]

# - Outer loop - iterate through start indices.
#   - Inner loop - iterate through pair indices.
#     Always break inner loop logic into separate method!
# ***

# Helper method `unique_pairs_from_index(array, index)`:
# Get unique combinations from index
#   pairs = []
#   first_pair_idx = index + 1
#   max_pair_idx = array.size - 1
#   (first_pair_idx..max_pair_idx).each do |pair_index|
#     pairs << [array[index], array[pair_index]]
#   Return pairs

# Main method `unique_pairs(array)`:
#   Loop from first to penultimate indices as `start_idx`
#   pairs = []
#   max_start_idx = array.size - 2
#   (0..max_start_idx).each do |start_idx|
#     pairs.concat(unique_pairs_from_index(array, start_idx))
#   Return pairs

def unique_pairs_from_index(array, index)
  pairs = []
  first_pair_idx = index + 1
  max_pair_idx = array.size - 1

  (first_pair_idx..max_pair_idx).each do |pair_index|
    pairs << [array[index], array[pair_index]]
  end

  pairs
end

def unique_pairs(array)
  pairs = []
  max_start_idx = array.size - 2

  (0..max_start_idx).each do |start_idx|
    pairs.concat(unique_pairs_from_index(array, start_idx))
  end

  pairs
end

p unique_pairs([12, 7, 17])
# => [[12, 7], [12, 17], [7, 17]]
