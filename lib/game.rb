class Game
  attr_reader :players, :board

  def initialize
    @players = []
    @board = Board.new
  end

  def add_player(player)
    @players << player
  end

end
