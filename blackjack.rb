$LOAD_PATH.unshift File.dirname(__FILE__)
require 'card'
require 'deck'

@new_deck = Deck.new
@new_deck.cards.shuffle!

@card_index = 51
@player_hand =[]
@dealer_hand =[]

def deal (id)
  if id == 1
    @player_hand << @new_deck.cards[@card_index]
  elsif id == 2
    @dealer_hand << @new_deck.cards[@card_index]
  else
    puts "Somehow you broke the program and dealt cards to a third party. Game goes to Cthulu."
  end
  
  @new_deck.cards.pop
  @card_index -= 1
end

deal(1)
deal(2)
deal(1)
deal(2)

puts "The Player's hand:"
@player_hand.each do |x|
  puts x.print_name
end

puts "The Dealer's hand:"
@dealer_hand.each do |x|
  puts x.print_name
end


  

