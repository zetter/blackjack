require './scoring'
require './player'

class Blackjack
  DECK = %w{H D S C}.product(1.upto(13).to_a)
  
  attr_reader :deck, :players
  
  def initialize(number_of_players)
    @deck = DECK.shuffle
    @players = Array.new(number_of_players) do |i|
      player_name = "Player #{i + 1}"
      Player.new(player_name)
    end

    deal_initial_cards
  end

  def puts_state
    @players.each.with_index {|player, index|
      puts player.to_s
      puts player.inspect
      puts "score #{player.points}"
      puts ""
    }
  end

  def deal_initial_cards
    2.times do
      @players.each{ |player| deal_card(player) }
    end
  end

  def deal_card(player)
    player << @deck.shift
  end
end

blackjack = Blackjack.new(2)

blackjack.players.each {|player|
  loop do
    break if player.points > 21
    if player.hit?
      blackjack.deal_card(player)
    else
      break
    end
  end
}

blackjack.puts_state
