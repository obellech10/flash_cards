require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/deck'
require 'pry'

card_1 = Card.new("What is 5 + 5?", 10, :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "Dog", "Turing Staff")
card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing", "Justin Bieber", "Pop Culture")

deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

def start
  puts "Welcome! You're playing with 4 cards."
  40.times {print "-"}
  puts
  puts "This is card number 1 of 4."
end

start
