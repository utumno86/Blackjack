class Card
  def initialize(suit,value,name)
    @suit=suit
    @value=value
    @name=name
    if name == "Ace"
      @is_ace = true
    else
      @is_ace = false
    end
  end

  def print_name
    puts "#{@name} of #{@suit}"
  end
end