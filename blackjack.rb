$LOAD_PATH.unshift File.dirname(__FILE__)
require 'card'
require 'deck'

class Blackjack
  def initialize (dealer_wins, player_wins, total_wins)
    @dealer_wins = dealer_wins
    @player_wins = player_wins
    @total_wins = total_wins
  end

  def dealer_wins
    @dealer_wins
  end

def player_wins
  @player_wins
end

def total_wins
  @total_wins
end

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
  
  def hand
    @new_deck = Deck.new

    @card_index = 51
    @player_hand =[]
    @dealer_hand =[]
    @player_done = false
    @dealer_done = false
    @player_value_total = 0
    @dealer_value_total = 0
    @new_deck.cards.shuffle!
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
      elsif @player_value_total <= 21
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
        puts "You broke the program. Cthulu would like to congratulate you."
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
      @dealer_wins += 1
      @total_wins += 1
    elsif @player_value_total > @dealer_value_total
      puts "You won this hand. Congratulations!"
      @player_wins += 1
      @total_wins += 1
    elsif @dealer_value_total == @player_value_total
      puts "Wow, there's a tie. The dealer wins ties, sucks to be you."
      @dealer_wins += 1
      @total_wins += 1
    else
      puts "Great, you broke the game again. Cthulu wins."
    end
  end
end


@game_over = false
@dealer_wins = 0
@player_wins = 0
@total_wins = 0

while @game_over == false do
  blackjack = Blackjack.new @dealer_wins, @player_wins, @total_wins
  blackjack.hand
  @dealer_wins = blackjack.dealer_wins
  @player_wins = blackjack.player_wins
  @total_wins = blackjack.total_wins
  puts "\n \n \n \n \n"
  puts "You have won #{@player_wins} times and the dealer has won #{@dealer_wins} times."
  puts "You have won #{(@player_wins / @total_wins) * 100} % of the time."
  puts "Would you like to play again? (yes/no)"
  answer = gets.chomp
  if answer == "no"
    puts "Thank you for playing"
    @game_over = true
  elsif answer != "yes"
    puts "You have chosen an invalid option. Cthulu conquers the world and also I'm ending this session."
    @game_over = true
  end
end


    
    






  

