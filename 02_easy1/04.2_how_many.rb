# frozen_string_literal: true

# Simple algorithm for minimum iterations:
# - Create a hash with a string key and a default integer value of 0.
# - Loop through each array `word`.
#   - Access the Hash at `word` and increment the value.

vehicles = %w[
  car car truck car SUV truck
  motorcycle motorcycle car truck
]

def occurrences_count(words)
  map = Hash.new(0)

  words.each { |word| map[word] += 1 }

  map
end

p occurrences_count(vehicles) == {
  'car' => 4,
  'truck' => 3,
  'SUV' => 1,
  'motorcycle' => 2
}

def occurrences_as_string(occurrences_count)
  string = String.new

  occurrences_count.each do |occurrence, count|
    string << "#{occurrence} => #{count}\n"
  end

  string
end

vehicles_as_string = occurrences_as_string(occurrences_count(vehicles))
p vehicles_as_string == <<~OUT
  car => 4
  truck => 3
  SUV => 1
  motorcycle => 2
OUT

puts vehicles_as_string
