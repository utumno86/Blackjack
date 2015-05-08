$LOAD_PATH.unshift File.dirname(__FILE__)
require 'card'
require 'deck'

@new_deck = Deck.new
@new_deck.cards.shuffle!

@card_index = 51
@player_hand =[]
@dealer_hand =[]
@player_done = false
@dealer_done = false
@player_value_total = 0
@dealer_value_total = 0

def deal (id)
  if id == 1
    @player_hand << @new_deck.cards[@card_index]
    @player_value_total += @new_deck.cards[@card_index].value
  elsif id == 2
    @dealer_hand << @new_deck.cards[@card_index]
    @dealer_value_total += @new_deck.cards[@card_index].value
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

until @player_done && @dealer_done == true do
  
  puts "Your hand:"
  @player_hand.each do |x|
    x.print_name
  end

  puts "You can see one of the dealer's cards:"
  @dealer_hand[0].print_name
  while @dealer_done != true do
    if @dealer_hand[0].value + @dealer_hand[1].value == 21
      puts "The dealer got a BLACKJACK. You SUPER lose."
      @player_value_total = 0
      @player_done = true
      @dealer_done = true
    elsif @dealer_value_total < 16
      deal(2)
    elsif @dealer_value_total > 21
     puts "The dealer went bust"
     @dealer_value_total = 0
     @dealer_done = true
    else
      @dealer_done = true
    end
  end

  if @player_hand[0].value + @player_hand[1].value == 21
    puts "BLACKJACK! You got that thing the game is named. You SUPER win."
    @dealer_value_total = 0
    @player_done = true
    @dealer_done = true
  elsif @player_value_total < 21
    puts "Would you like to hit or stay?"
    answer = gets.chomp
    if answer == "hit"
      puts "You draw a card"
      deal(1)
    elsif answer == "stay"
      puts "You stay"
      @player_done = true
    else
      puts "Sorry, you have entered an invalid command. Keep playing while I summon Cthulu on you."
    end
  elsif @player_value_total > 21
    puts "You went bust"
    @player_done = true
    @player_value_total = 0
  else
    puts "You either have a 21 or have broken the program. Cthulu would like to congratulate you."
  end
end

puts "Your hand:"
  @player_hand.each do |x|
    x.print_name
  end

puts "Dealer hand:"
  @dealer_hand.each do |x|
    x.print_name
  end

if @dealer_value_total > @player_value_total
  puts "Tough luck! The Dealer won this one."
elsif @player_value_total > @dealer_value_total
  puts "You won this hand. Congratulations!"
elsif @dealer_value_total == @player_value_total
  puts "Wow, there's a tie. Didn't see that one coming."
else
  puts "Great, you broke the game again. Cthulu wins."
end

puts "Thank you for playing my Blackjack game. If you would like to play again, just type ruby blackjack.rb into the console!"
    
    






  

