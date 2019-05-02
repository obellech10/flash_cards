require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
    @turn_1 = Turn.new("Not Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, setup
  end

  def test_it_has_a_card
    assert_equal @card, @turn.card
  end

  def test_it_has_a_guess
    assert_equal @turn.guess, "Juneau"
  end

  def test_if_correct?
    assert @turn.correct?
  end

  def test_it_has_feedback
    assert_equal @turn.feedback, "Correct!"
    assert_equal @turn_1.feedback, "Incorrect."
  end
end
