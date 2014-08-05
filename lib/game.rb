class Game
  attr_reader :players, :board

  def initialize
    @players = []
    @board = Board.new
  end

  def add_player(player)
    @players << player
  end

  def game_over?

    for x_coord in 0..2 # tests col win
      if @board.all_spaces[x_coord][0].is_marked_by.symbol ==
         @board.all_spaces[x_coord][0].is_marked_by.symbol &&
         @board.all_spaces[x_coord][0].is_marked_by.symbol ==
         @board.all_spaces[x_coord][0].is_marked_by.symbol
        return true
      end
    end

    for y_coord in 0..2 # tests row win
      if @board.all_spaces[0][y_coord].is_marked_by.symbol ==
         @board.all_spaces[0][y_coord].is_marked_by.symbol &&
         @board.all_spaces[0][y_coord].is_marked_by.symbol ==
         @board.all_spaces[0][y_coord].is_marked_by.symbol
        return true
      end
    end

  end

end
