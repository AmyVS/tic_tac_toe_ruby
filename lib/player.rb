class Player

  attr_reader :name, :symbol

  def initialize (attributes)
    @name = attributes[:name]
  end

  def add_symbol (attributes)
    @symbol = attributes[:symbol]
  end

end
