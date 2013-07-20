class Scoring
  attr_reader :hand
  
  def initialize(hand)
    @hand = hand
  end
  
  def value
    picture_cards_normalized = @hand.map {|card| 
      if card > 10
        10
      else
        card
      end
    }
    
    number_of_aces = picture_cards_normalized.count {|card| card == 1}
    total = picture_cards_normalized.inject(:+)
    
    number_of_aces.times {|_|
      total += 10 if (total + 10) < 22
    }

    total
  end
end
# 
# puts 'expecting 13'
# puts Scoring.new([1, 2]).value
# puts ''
# 
# puts 'expecting 13'
# puts Scoring.new([1, 2, 10]).value
# puts ''
# 
# puts 'expecting 40'
# puts Scoring.new([10, 11, 12, 13]).value
# puts ''
# 
# puts 'expecting 12'
# puts Scoring.new([1, 1]).value
# puts ''
# 
# puts 'expecting 13'
# puts Scoring.new([1, 1, 1]).value
# puts ''

