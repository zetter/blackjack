class Player
  def initialize(name)
    @name = name
    @hand = Hand.new([])
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
  
  def score
    @hand.score
  end

  def hit?
    puts "#{@name} go:"
    puts @hand.inspect
    puts "(H)it or (S)tay?"
    choice = gets.strip
    choice.upcase == 'H'
  end
end