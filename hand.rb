class Hand < DelegateClass(Array)

  def initialize(arr)
    super(arr)
  end

  def score
    picture_cards_normalized = map(&:last).map {|card|
      if card > 10
        10
      else
        card
      end
    }

    number_of_aces = picture_cards_normalized.count {|card| card == 1}
    total = picture_cards_normalized.inject(:+)

    number_of_aces.times {|_|
      total += 10 if (total + 10) <= Blackjack::MAX_POINTS
    }

    total
  end
end

