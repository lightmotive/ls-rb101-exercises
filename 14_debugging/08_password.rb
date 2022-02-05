# frozen_string_literal: true

# The following code prompts the user to set their own password if they haven't
# done so already, and then prompts them to login with that password. However,
# the program throws an error. What is the problem and how can you fix it?
#
# Once you get the program to run without error, does it behave as expected?
# Verify that you are able to log in with your new password.

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

def verify_password
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  # The problem is on the following line: `password` is not defined within the
  # `verify_assword` method's scope.
  #
  # `password` is initialized in the `main` program scope (line 10 above), but
  # it is not assigned anywhere. A programmer that's unfamiliar with Ruby might
  # think it's assigned in the `set_password` method, but methods in Ruby create
  # a new local variable scope that cannot access local variables that were
  # initialized outside that scope.
  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  set_password
end

verify_password
