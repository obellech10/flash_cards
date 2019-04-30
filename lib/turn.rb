require './lib/card'


class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    @guess == card.answer 
  end

  def feedback
    if correct? == true
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end

end
