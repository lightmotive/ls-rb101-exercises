# frozen_string_literal: true

# We started working on a card game but got stuck. Check out why the code below
# raises a **TypeError**.
#
# Once you get the program to run and produce a `sum`, you might notice that the
# sum is off: It's lower than it should be. Why is that?

CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace].freeze

# First problem: the deck hash values all point to the same array.
# When the program `shuffle`s and `pop`s cards, it's shuffling and popping
# from the same array for each suit.
# What we want to do is `dup` the cards array for each suit:
deck = { hearts: CARDS.dup,
         diamonds: CARDS.dup,
         clubs: CARDS.dup,
         spades: CARDS.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

def cards_score(cards)
  cards.map { |card| score(card) }.sum
end

def card_set_score(card_set)
  card_set.reduce(0) do |sum, cards|
    sum + cards_score(cards)
  end
end

# For testing:
deck_score = card_set_score(deck.values)

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

# remaining_cards_score = deck.reduce(0) do |sum, (_, remaining_cards)|
#   # remaining_cards.map do |card|
#   #   score(card)
#   # end

#   # sum += remaining_cards.sum
#   # Another problem: `remaining_cards` on line 42 still contains the cards,
#   # including suits. The intent is to map `remaining_cards` to the associated
#   # scores. Line 38 creates that new mapped collection, but doesn't assign it
#   # to a new variable for later use.
#   # Mutation is generally not preferable when unnecessary, so here's the best
#   # solution:
#   scores = remaining_cards.map do |card|
#     score(card)
#   end

#   sum + scores.sum
#   # Note that we renamed the outer scope variable `sum` to
#   # `remaining_cards_score` to avoid variable shadowing.
# end

# Simplify expression above:
remaining_cards_score = card_set_score(deck.values)

player_score = player_cards.map { |card| score(card) }.sum

puts deck_score == player_score + remaining_cards_score
