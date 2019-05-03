require '../lib/card'
require '../lib/deck'

class Round
  attr_reader :deck, :turn

  def initialize(deck)
    @deck = deck
    @turn = []
  end

  def turns
    @turn
  end

end
