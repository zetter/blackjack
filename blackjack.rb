require 'delegate'

require './hand'
require './player'

class Blackjack
  DECK = %w{H D S C}.product(1.upto(13).to_a)
  MAX_POINTS = 21

  attr_reader :deck, :players

  def initialize(number_of_players)
    @deck = DECK.shuffle
    @players = Array.new(number_of_players) do |i|
      player_name = "Player #{i + 1}"
      Player.new(player_name)
    end

    deal_initial_cards
  end

  def deal_initial_cards
    2.times do
      @players.each{ |player| deal_card(player) }
    end
  end

  def deal_card(player)
    player << @deck.shift
  end

  def make_move_for_player(player)
    loop do
      break if player.score > MAX_POINTS

      if player.hit?
        deal_card(player)
      else
        break
      end
    end

  end

  def self.play(number_of_players = 2)
    blackjack = new(number_of_players)

    blackjack.players.each do |player|
      blackjack.make_move_for_player(player)
    end

    blackjack.players.each {|player|
      puts "#{player.to_s} has #{player.score} points"
    }
  end
end
