require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'pry'

class RoundTest < MiniTest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round_1 = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round_1
  end

  def test_it_has_a_deck
    assert_equal @deck, @round_1.deck
  end

  def test_the_turn
    assert_equal [], @round_1.turns
  end

  def test_current_card
    assert_equal @card_1, @round_1.current_card
  end

  def test_if_it_takes_a_new_turn
    @round_1.take_turn("Juneau")
    assert_instance_of Turn, @round_1.turns.last
  end

  def test_if_turn_is_correct
    @round_1.take_turn("Juneau")
    assert_equal true , @round_1.turns.last.correct?
  end

  def test_number_correct_1
    @round_1.take_turn("Juneau")
    assert_equal 1, @round_1.number_correct
  end


  def test_it_takes_a_another_turn
    @round_1.take_turn("Mars")
    assert_instance_of Turn, @round_1.turns.last
  end

  def test_number_correct_by_category
    @round_1.take_turn("Juneau")
    assert_equal 1, @round_1.number_correct_by_category(:Geography)
  end

  def test_percent_correct
    @round_1.take_turn("Juneau")
    @round_1.take_turn("Mars")
    assert_equal 50.0 , @round_1.percent_correct
  end

  def test_percent_correct_by_category
    @round_1.take_turn("Juneau")
    @round_1.take_turn("Mars")
    assert_equal 100.0 , @round_1.percent_correct_by_category(:Geography)
  end

  def test_percent_correct_by_category
    @round_1.take_turn("Juneau")
    @round_1.take_turn("Venus")
    assert_equal 0.0 , @round_1.percent_correct_by_category(:STEM)
  end
end
