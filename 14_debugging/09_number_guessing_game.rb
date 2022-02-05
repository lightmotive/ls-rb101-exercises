# frozen_string_literal: true

# A friend of yours wrote a number guessing game. The first version he shows
# you picks a random number between 1 and a provided maximum number and offers
# you a given number of attempts to guess it.
#
# However, when you try it, you notice that it's not working as expected.
# Run the code and observe its behavior. Can you figure out what is wrong?

def valid_integer?(string)
  string.to_i.to_s == string
end

def clear_console
  system('clear') || system('cls')
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    break if attempts >= max_attempts

    input = nil

    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end
    attempts += 1

    guess = input.to_i

    break (puts 'Yes! You win.') if guess == winning_number
    next (puts 'Nope. Too small.') if guess < winning_number
    next (puts 'Nope. Too big.') if guess > winning_number
  end

  # Play again?
  print 'Would you like to play again? '
  if gets.strip.downcase.start_with?('y')
    clear_console
    guess_number(max_number, max_attempts)
  end
end

guess_number(10, 3)

# Program issues:
# - The game doesn't end when max attempts is reached.
# - The game doesn't exit upon winning.

# UX recommendations:
# - Indicate the number range and number of attempts remaining.
