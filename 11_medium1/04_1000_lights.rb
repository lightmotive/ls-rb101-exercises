# frozen_string_literal: true

# P1: Understand the problem
# Inputs: Integer (number of lights and toggle passes)
# Outputs: Array of light numbers that are on
#
# Implicit requirements:
# - Skip the number of lights equal to the current pass number (index 1)
#   minus 1.
#
# Mental model:
# - Create an array of n lights that are initially off, then pass through n
#   times toggling each light on/off. From the beginning, skip the number of
#   lights equal to [pass number] - 1.

# P2: Examples/Test Cases
# - Example 1:
#   - Input: n = 5
#   - Output: [1, 4]
# - Example 2:
#   - Input: n = 10
#   - Output: [1, 4, 9]

# P3: Data Structure
# We will need an array of lights that includes a number and a state.
# The most convenient way to represent that would be an array of hashes:
# - [{number: 1, on: false}, ...]

# P4: Algorithm
# * Overview *
# 1. Build lights array.
# 2. Iterate through array n times.
#   - Skip (round n) - 1 lights.
#   - Toggle light's :on value (boolean).
#   - Return array of light numbers that are on.

# P5: Implementation

def build_lights(count, initial_state_on: false)
  (1..count).to_a.map { |number| { number: number, on: initial_state_on } }
end

def toggle_lights(lights, rounds)
  # - Skip (round n) - 1 lights.
  # - Toggle light's :on value (boolean).
  # - Return array of light numbers that are on.
end

p toggle_lights(build_lights(5), 5) == [1, 4]
p toggle_lights(build_lights(10), 10) == [1, 4, 9]
