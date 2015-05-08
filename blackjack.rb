$LOAD_PATH.unshift File.dirname(__FILE__)
require 'card'
require 'deck'

new_deck = Deck.new
new_deck.cards.shuffle!

new_deck.cards.each do |x|
  x.print_name
end