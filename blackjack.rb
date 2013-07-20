require './scoring'

class Blackjack
  DECK = %w{H D S C}.product(1.upto(13).to_a)
  
  attr_reader :deck, :players
  
  def initialize(number_of_players)
    @players = []
    @deck = DECK.shuffle

    number_of_players.times{|player| @players << []}
  end

  def puts_state
    @players.each.with_index {|player, index|
      puts "player #{index}"
      puts player.inspect
      puts "score #{card_value(index)}"
      puts ""
    }
  end

  def deal!
    2.times do |_|
      @players.each{|player| player << @deck.shift}
    end
  end

  def deal_card(player_number)
    @players[player_number] << @deck.shift
  end
  
  def card_value(player_number)
    cards_for_player = @players[player_number].map(&:last)
    Scoring.new(cards_for_player).value
  end
end

blackjack = Blackjack.new(2)
blackjack.deal!

blackjack.players.each.with_index {|player, index|
  loop do
    break if blackjack.card_value(index) > 21

    puts "player #{index} go:"
    puts player.inspect
    puts "H for Hit, S for Stay"
    choice = gets.strip
    if choice.upcase == 'H'
      blackjack.deal_card(index)
    else
      break
    end
  end
}

blackjack.puts_state
