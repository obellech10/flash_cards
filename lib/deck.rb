  require '../lib/card'


class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  # def cards_in_category(category)
  #   cards.select{|card| card.category == category }
  # end
  def cards_in_category(category)
    card_category = []

    @cards.each do |card|
      if category == card.category
        card_category.push(card)
      end
    end
    card_category
  end


end
