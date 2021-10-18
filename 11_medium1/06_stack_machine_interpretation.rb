# frozen_string_literal: true

# * Understand the problem *
# Input: string
# Output: interpreted program may or may not print values to the screen
#
# A register contains a value, a stack contains commands, and the program
# executes those commands to modify the register, perform math operations,
# and print values.
#
# Basic logic:
# - Split the command string
# - Interpret commands
#   - If command is not found in hash, it must be an integer.
# - Perform operations sequentially

def stack_operate!(state, operation)
  state[:register] = state[:register].send(operation, state[:stack].pop)
end

COMMANDS = {
  PRINT: lambda do |state|
           output = state[:register].to_s
           state[:stdout_log].push(output)
           puts output
         end,
  PUSH: ->(state) { state[:stack].push(state[:register]) },
  POP: ->(state) { state[:register] = state[:stack].pop },
  ADD: ->(state) { stack_operate!(state, :+) },
  SUB: ->(state) { stack_operate!(state, :-) },
  MULT: ->(state) { stack_operate!(state, :*) },
  DIV: ->(state) { stack_operate!(state, :/) },
  MOD: ->(state) { stack_operate!(state, :%) },
  default: ->(state, command_string) { state[:register] = command_string.to_i }
  # Interpret integers (n) if command is not in the list above
}.freeze

def minilang(command_string)
  state = { register: 0, stack: [], command_strings: command_string.split,
            stdout_log: [] }

  until state[:command_strings].empty?
    command_string = state[:command_strings].shift
    command = COMMANDS.fetch(command_string.to_sym, nil)
    next COMMANDS[:default].call(state, command_string) if command.nil?

    command.call(state)
  end

  state
end

p minilang('PRINT')[:stdout_log] == ['0']
p minilang('5 PUSH 3 MULT PRINT')[:stdout_log] == ['15']
p minilang('5 PRINT PUSH 3 PRINT ADD PRINT')[:stdout_log] == %w[5 3 8]
p minilang('5 PUSH POP PRINT')[:stdout_log] == ['5']
p minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')[
  :stdout_log] ==  %w[5 10 4 7]
p minilang('3 PUSH PUSH 7 DIV MULT PRINT ')[:stdout_log] == ['6']
p minilang('4 PUSH PUSH 7 MOD MULT PRINT ')[:stdout_log] == ['12']
p minilang('-3 PUSH 5 SUB PRINT')[:stdout_log] == ['8']
p minilang('6 PUSH')[:stdout_log] == []
