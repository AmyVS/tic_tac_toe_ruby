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

    for x_coord in 0..2 # tests row win
      if @board.all_spaces[x_coord][0].is_marked? &&
         @board.all_spaces[x_coord][1].is_marked? &&
         @board.all_spaces[x_coord][2].is_marked? &&
         (@board.all_spaces[x_coord][0].is_marked_by.symbol ==
          @board.all_spaces[x_coord][1].is_marked_by.symbol) &&
         (@board.all_spaces[x_coord][1].is_marked_by.symbol ==
          @board.all_spaces[x_coord][2].is_marked_by.symbol)
       return [true, "win", "row"+x_coord.to_s, @board.all_spaces[x_coord][2].is_marked_by.symbol]
      end
    end

    for y_coord in 0..2 # tests column win
      if @board.all_spaces[0][y_coord].is_marked? &&
         @board.all_spaces[1][y_coord].is_marked? &&
         @board.all_spaces[2][y_coord].is_marked? &&
         (@board.all_spaces[0][y_coord].is_marked_by.symbol ==
          @board.all_spaces[1][y_coord].is_marked_by.symbol) &&
         (@board.all_spaces[1][y_coord].is_marked_by.symbol ==
          @board.all_spaces[2][y_coord].is_marked_by.symbol)
        return [true, "win", "col"+y_coord.to_s, @board.all_spaces[2][y_coord].is_marked_by.symbol]
      end
    end

    if @board.all_spaces[2][0].is_marked? && # test the additive diagonal win
         @board.all_spaces[1][1].is_marked? &&
         @board.all_spaces[0][2].is_marked? &&
         (@board.all_spaces[2][0].is_marked_by.symbol ==
          @board.all_spaces[1][1].is_marked_by.symbol) &&
         (@board.all_spaces[1][1].is_marked_by.symbol ==
          @board.all_spaces[0][2].is_marked_by.symbol)
      return [true, "win", "diagadd", @board.all_spaces[0][2].is_marked_by.symbol]
    end

    if @board.all_spaces[0][0].is_marked? && # test the subtractive diagonal win
         @board.all_spaces[1][1].is_marked? &&
         @board.all_spaces[2][2].is_marked? &&
         (@board.all_spaces[0][0].is_marked_by.symbol ==
          @board.all_spaces[1][1].is_marked_by.symbol) &&
         (@board.all_spaces[1][1].is_marked_by.symbol ==
          @board.all_spaces[2][2].is_marked_by.symbol)
      return [true, "win", "diagsub", @board.all_spaces[0][0].is_marked_by.symbol]
    end

    for x_coord in 0..2 do
      for y_coord in 0..2 do
        if !@board.all_spaces[x_coord][y_coord].is_marked?
          return [false, "", "", ""]
        end
      end
    end

    return [true, "draw", "", ""]

  end

end
