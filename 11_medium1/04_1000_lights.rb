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
#   times toggling each light on/off. From the beginning, step the number of
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
# 1. Create lights array.
# 2. Iterate through array n times.
#   - Skip (round n) - 1 lights.
#   - Toggle light's :on value (boolean).
#   - Return array of light numbers that are on.

# P5: Implementation

def lights_create(count, initial_state_on: false)
  (1..count).each_with_object({}) do |number, lights|
    lights[number] = initial_state_on
  end
end

def lights_toggle!(lights, numbers)
  numbers.each { |number| lights[number] = !lights[number] }
end

# Generate (1..rounds) in rounds with a step that equals the current round.
def numbers_in_rounds_with_round_step(rounds)
  1.upto(rounds) do |round|
    numbers = (round..rounds).step(round).to_a
    yield(numbers)
  end
end

def lights_on(lights)
  lights.select { |_, on| on }.keys
end

def toggle_lights!(lights)
  numbers_in_rounds_with_round_step(lights.size) do |numbers|
    lights_toggle!(lights, numbers)
  end
end

def toggle_lights_test(light_count)
  lights = lights_create(light_count)
  toggle_lights!(lights)
  lights_on(lights)
end

p toggle_lights_test(1000) == [
  1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324,
  361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961
]
