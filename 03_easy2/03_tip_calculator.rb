# frozen_string_literal: true

def prompt(message)
  print "-> #{message} "
end

def total_print(tip_amount, total)
  puts format('Tip: $%.2f', tip_amount)
  puts format('Total: $%.2f', total)
end

prompt("What's the bill?")
bill = gets.chomp.to_f

prompt("What's the tip percentage?")
tip_percent = gets.chomp.to_i / 100.to_f

tip_amount = bill * tip_percent
total = bill + tip_amount

total_print(tip_amount, total)
