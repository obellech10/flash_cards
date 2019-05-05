require './lib/card'
require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0
  end

  def current_card
    # @deck.cards.shift
    @deck.cards[0]

  end

  def take_turn(guess)
    new_turn = Turn.new(guess, self.current_card)
      @turns << new_turn
      @deck.cards.shift
      @turns.last

  end

  def number_correct
    if @turns.last.correct?
      @correct += 1
    end
    @correct
  end

end
