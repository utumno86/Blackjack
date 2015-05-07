require_relative '/Users/utumn_000/coding/Blackjack/card.rb'
class Deck
  
  def initialize
    @cards = []
    suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
    
    suits.each do |suit|
      (2..10).each do |value|
        name = "#{value}"
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

  def shuffle
  end
end

new_deck = Deck.new
new_deck.cards.shuffle!

new_deck.cards.each do |x|
  x.print_name
end