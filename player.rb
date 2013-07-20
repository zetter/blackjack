class Player
  def initialize(name)
    @name = name
    @hand = []
  end

  def to_s
    @name
  end
  
  def inspect
    @hand.inspect
  end

  def <<(card)
    @hand << card
  end

  def points
    card_values = @hand.map(&:last)
    Scoring.new(card_values).value
  end

  def hit?
    puts "#{@name} go:"
    puts @hand.inspect
    puts "(H)it or (S)tay?"
    choice = gets.strip
    choice.upcase == 'H'
  end
end