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
  def ace
    @is_ace
  end

  def print_name
    puts "The #{@name} of #{@suit}"
  end

  def value
    @value
  end
end