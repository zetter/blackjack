require 'minitest/autorun'
require './blackjack'

class HandTest < MiniTest::Unit::TestCase
  def test_aces_get_counted_at_high
    hand = Hand.new([['H', 1], ['H', 2]])
    assert_equal 13, hand.score
  end
  
  def test_multiple_high_aces
    hand = Hand.new([['H', 1], ['H', 2]])
    assert_equal 13, hand.score
  end

  def test_aces_get_counted_as_low
    hand = Hand.new([['H', 1], ['H', 2], ['H', 10]])
    assert_equal 13, hand.score
  end

  def test_aces_get_counted_high_unless_it_passes_limit
    hand = Hand.new([['H', 1], ['H', 1], ['H', 1]])
    assert_equal 13, hand.score
  end

  def test_picture_cards_are_counted_as_ten
    hand = Hand.new([['H', 10], ['H', 11], ['H', 12], ['H', 13]])
    assert_equal 40, hand.score
  end
end
