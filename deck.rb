$LOAD_PATH.unshift File.dirname(__FILE__)
require 'card'
class Deck
  
  def initialize
    @cards = []
    suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
    
    suits.each do |suit|
      (2..10).each do |value|
        name = value.to_s
        @cards << Card.new(suit, value, name)
      end
      
      @cards << Card.new(suit, 10, "Jack")
      @cards << Card.new(suit, 10, "Queen")
      @cards << Card.new(suit, 10, "King")
      @cards << Card.new(suit, 1, "Ace")
    end

  end

  def cards
    @cards
  end

end

